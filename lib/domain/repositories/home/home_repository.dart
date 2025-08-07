import 'dart:io';
import 'dart:ui';

import '../../models/processed_image/processed_image_model.dart';

/// Repository interface for home screen operations
///
/// Defines contract for image processing and storage operations
abstract class HomeRepository {
  /// Picks an image from device gallery
  ///
  /// Returns [File] of selected image or null if cancelled
  /// Throws [Exception] if permission denied or operation fails
  Future<File?> pickImageFromGallery();

  /// Picks an image using device camera
  ///
  /// Returns [File] of captured image or null if cancelled
  /// Throws [Exception] if permission denied or operation fails
  Future<File?> pickImageFromCamera();

  /// Removes background from the provided image
  ///
  /// [imageFile] - The image file to process
  /// [backgroundColor] - Optional background color to apply
  ///
  /// Returns [ProcessedImageModel] containing original and processed images
  /// Throws [Exception] if processing fails
  Future<ProcessedImageModel> removeBackground(File imageFile, {Color? backgroundColor});

  /// Saves processed image to device gallery
  ///
  /// [processedImage] - The processed image to save
  ///
  /// Returns [bool] indicating success
  /// Throws [Exception] if save operation fails
  Future<bool> saveImageToGallery(ProcessedImageModel processedImage);

  /// Checks if storage permission is granted
  ///
  /// Returns [bool] true if permission is available
  Future<bool> hasStoragePermission();

  /// Requests storage permission from user
  ///
  /// Returns [bool] true if permission is granted
  Future<bool> requestStoragePermission();


  /// To control the sliding function
  Future<void> completeOnboarding();




}
