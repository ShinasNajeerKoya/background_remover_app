import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../../core/app_permissions.dart';
import '../../../../domain/models/processed_image/processed_image_model.dart';
import '../../../../shared/mixins/safe_emit_mixin/safe_emit_mixin.dart';
import 'home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:background_remover_app/domain/repositories/home/home_repository.dart';

enum SliderStage { pickImage, removeBackground, saveImage }

class HomeBloc extends Cubit<HomeState> with SafeEmitMixin<HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const HomeState()) {
    checkInitialPermission();
  }

  /// Check permission status on initialization
  Future<void> checkInitialPermission() async {
    try {
      final hasPermission = await _repository.hasStoragePermission();
      safeEmit(state.copyWith(hasPermission: hasPermission));
    } catch (e) {
      safeEmit(state.copyWith(error: true, errorMessage: 'Failed to check permissions: $e'));
    }
  }

  /// Request storage permission
  Future<void> requestPermission() async {
    try {
      final permissionResult = await AppPermissions.requestMediaWithFeedback();
      safeEmit(
        state.copyWith(
          hasPermission: permissionResult.isGranted,
          error: !permissionResult.isGranted,
          errorMessage: permissionResult.isGranted ? '' : permissionResult.message,
        ),
      );
    } catch (e) {
      safeEmit(state.copyWith(hasPermission: false, error: true, errorMessage: 'Failed to request permission: $e'));
    }
  }

  /// Pick image from gallery
  Future<void> pickImageFromGallery() async {
    safeEmit(state.copyWith(isLoading: true, error: false));

    try {
      // Check permission first
      if (!state.hasPermission) {
        final permissionResult = await AppPermissions.requestMediaWithFeedback();
        safeEmit(state.copyWith(hasPermission: permissionResult.isGranted));

        if (!permissionResult.isGranted) {
          safeEmit(state.copyWith(isLoading: false, error: true, errorMessage: permissionResult.message));
          return;
        }
      }

      final File? imageFile = await _repository.pickImageFromGallery();

      if (imageFile != null) {
        safeEmit(
          state.copyWith(
            isLoading: false,
            selectedImage: imageFile,
            // homeSelectedImage: imageFile,
            processedImage: null, // Reset processed image
          ),
        );
      } else {
        safeEmit(state.copyWith(isLoading: false));
      }
    } catch (e) {
      safeEmit(state.copyWith(isLoading: false, error: true, errorMessage: 'Failed to pick image: $e'));
    }
  }

  /// Pick image from camera
  Future<void> pickImageFromCamera() async {
    safeEmit(state.copyWith(isLoading: true, error: false));

    try {
      final File? imageFile = await _repository.pickImageFromCamera();

      if (imageFile != null) {
        safeEmit(
          state.copyWith(
            isLoading: false,
            selectedImage: imageFile,
            homeSelectedImage: imageFile, // working copy
            processedImage: null, // Reset processed image
          ),
        );
      } else {
        safeEmit(state.copyWith(isLoading: false));
      }
    } catch (e) {
      safeEmit(state.copyWith(isLoading: false, error: true, errorMessage: 'Failed to capture image: $e'));
    }
  }

  /// Remove background from selected image
  Future<void> removeBackground({Color? backgroundColor}) async {
    if (state.selectedImage == null) return;

    safeEmit(state.copyWith(isProcessing: true, error: false, processingProgress: 0));

    try {
      // Simulate progress updates
      safeEmit(state.copyWith(processingProgress: 25));

      final processedImage = await _repository.removeBackground(
        state.selectedImage!,
        backgroundColor: backgroundColor ?? state.selectedBackgroundColor,
      );

      safeEmit(state.copyWith(processingProgress: 75));

      safeEmit(state.copyWith(isProcessing: false, processedImage: processedImage, processingProgress: 100));

      // Reset progress after a delay
      await Future.delayed(const Duration(seconds: 1));
      safeEmit(state.copyWith(processingProgress: 0));
    } catch (e) {
      safeEmit(
        state.copyWith(
          isProcessing: false,
          error: true,
          errorMessage: 'Failed to remove background: $e',
          processingProgress: 0,
        ),
      );
    }
  }

  /// Save processed image to gallery
  Future<void> saveProcessedImage() async {
    if (state.processedImage == null) return;

    safeEmit(state.copyWith(isSaving: true, error: false));

    try {
      final success = await _repository.saveImageToGallery(state.processedImage!);

      if (success) {
        safeEmit(state.copyWith(isSaving: false));
        // You might want to show a success message here
      } else {
        safeEmit(state.copyWith(isSaving: false, error: true, errorMessage: 'Failed to save image to gallery'));
      }
    } catch (e) {
      safeEmit(state.copyWith(isSaving: false, error: true, errorMessage: 'Failed to save image: $e'));
    }
  }

  /// Crop selected image
  Future<void> cropSelectedImage() async {
    if (state.selectedImage == null) return;
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: state.selectedImage!.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1), // optional
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(title: 'Crop Image'),
        ],
      );
      if (croppedFile != null) {
        safeEmit(state.copyWith(selectedImage: File(croppedFile.path)));
      }
    } catch (e) {
      safeEmit(state.copyWith(error: true, errorMessage: 'Failed to crop image: $e'));
    }
  }

  /// Save selected image into processedImage
  void saveSelectedImage() {
    if (state.selectedImage != null) {
      final file = state.selectedImage!;
      final processed = ProcessedImageModel(
        originalImagePath: state.selectedImage?.path ?? file.path,
        processedImagePath: file.path,
        processedAt: DateTime.now(),
        processedFileSize: file.lengthSync(),
        processingDuration: 0,
      );

      safeEmit(state.copyWith(processedImage: processed, homeSelectedImage: state.selectedImage));
    }
  }

  /// Change background color
  void changeBackgroundColor(Color color) {
    safeEmit(state.copyWith(selectedBackgroundColor: color, showBackgroundColorPicker: false));
  }

  /// Toggle background color picker
  void toggleBackgroundColorPicker() {
    safeEmit(state.copyWith(showBackgroundColorPicker: true));
  }

  Future<void> completeOnboardingFlow() async {
    safeEmit(state.copyWith(isLoading: true));
    try {
      await _repository.completeOnboarding();
      safeEmit(state.copyWith(isCompleted: true, isLoading: false));
    } catch (_) {
      safeEmit(state.copyWith(isLoading: false, error: true));
    }
  }

  void completeSlider() {
    // Trigger some action or log
    debugPrint('Slider successful');
  }

  void onSwipeUpdate(double delta, double maxDrag) {
    final newX = (state.dragX + delta).clamp(0.0, maxDrag);
    safeEmit(state.copyWith(dragX: newX));
  }

  void updateDragX(double x) {
    safeEmit(state.copyWith(dragX: x));
  }

  void onSwipeEnd(double maxDrag) {
    if (!state.sliderCompleted && state.dragX >= maxDrag) {
      // log('slide completed');

      // switch (state.sliderStage) {
      //   case SliderStage.pickImage:
      //     pickImageFromGallery();
      //     break;
      //   case SliderStage.removeBackground:
      //     removeBackground();
      //     break;
      //   case SliderStage.saveImage:
      //     saveProcessedImage();
      //     break;
      // }

      // safeEmit(state.copyWith(sliderCompleted: true));
      safeEmit(state.copyWith(sliderCompleted: false, dragX: 0));
      completeOnboardingFlow();
    }
  }

  /// Reset state
  void reset() {
    safeEmit(const HomeState());
    checkInitialPermission();
  }

  /// Clear error
  void clearError() {
    safeEmit(state.copyWith(error: false, errorMessage: ''));
  }
}

extension SliderStageHelper on HomeState {
  SliderStage get sliderStage {
    if (selectedImage == null) {
      return SliderStage.pickImage;
    } else if (processedImage == null) {
      return SliderStage.removeBackground;
    } else {
      return SliderStage.saveImage;
    }
  }
}
