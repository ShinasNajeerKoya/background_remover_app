import 'dart:io';
import 'dart:ui';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../core/services/permission_service.dart';
import '../../../domain/models/processed_image/processed_image_model.dart';
import '../../../domain/repositories/home/home_repository.dart';
import '../../services/background_removal_service/background_removal_service.dart';

/// Implementation of [HomeRepository] interface
///
/// Handles image picking, processing, and storage operations
class HomeRepositoryImpl implements HomeRepository {
  final ImagePicker _imagePicker;

  HomeRepositoryImpl({ImagePicker? imagePicker})
      : _imagePicker = imagePicker ?? ImagePicker();

  @override
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100, // Maintain high quality for processing
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to pick image from gallery: $e');
    }
  }

  @override
  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100, // Maintain high quality for processing
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to capture image from camera: $e');
    }
  }

  @override
  Future<ProcessedImageModel> removeBackground(
      File imageFile, {
        Color? backgroundColor,
        double threshold = 0.5,
        bool smoothMask = true,
        bool enhanceEdges = true,
        Function(double progress)? onProgress,
      }) async {
    try {
      final stopwatch = Stopwatch()..start();

      // Validate image file before processing
      final isValid = await BackgroundRemovalService.validateImageFile(imageFile);
      if (!isValid) {
        throw Exception('Selected image is invalid or not suitable for processing');
      }

      // Process the image with progress callback
      final File processedFile = await BackgroundRemovalService.removeBackgroundFromImage(
        imageFile,
        backgroundColor: backgroundColor,
        threshold: threshold,
        smoothMask: smoothMask,
        enhanceEdges: enhanceEdges,
        onProgress: onProgress,
      );

      stopwatch.stop();
      final int processingDuration = stopwatch.elapsedMilliseconds;

      // Get file size
      final int fileSize = await BackgroundRemovalService.getFileSize(processedFile);

      return ProcessedImageModel.fromFiles(
        originalImage: imageFile,
        processedImage: processedFile,
        backgroundColor: backgroundColor?.toString(),
        processedAt: DateTime.now(),
        processedFileSize: fileSize,
        processingDuration: processingDuration,
      );
    } catch (e) {
      throw Exception('Failed to remove background: $e');
    }
  }

  @override
  Future<bool> saveImageToGallery(ProcessedImageModel processedImage) async {
    try {
      // Check permission before saving
      final hasPermission = await hasStoragePermission();
      if (!hasPermission) {
        final permissionGranted = await requestStoragePermission();
        if (!permissionGranted) {
          throw Exception('Storage permission required to save image');
        }
      }

      // Save to gallery using Gal package
      await Gal.putImage(processedImage.processedImagePath);
      return true;
    } catch (e) {
      throw Exception('Failed to save image to gallery: $e');
    }
  }

  @override
  Future<bool> hasStoragePermission() async {
    return await PermissionService.isMediaPermissionGranted();
  }

  @override
  Future<bool> requestStoragePermission() async {
    final result = await PermissionService.requestMediaPermission();
    return result.isAuth;
  }
}