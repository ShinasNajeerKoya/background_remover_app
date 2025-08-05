import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_background_remover/image_background_remover.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

/// Service class for handling background removal operations using ONNX model
///
/// This service provides methods to process images and apply background colors
/// using the image_background_remover package which works completely offline.
///
/// Key Features:
/// - Remove background from images with high accuracy
/// - Works entirely offline without external API dependencies
/// - Customizable threshold, smooth masking, and edge enhancement
/// - Add custom background colors or gradients
///
/// Usage:
/// 1. Initialize the service once in your app: `await BackgroundRemovalService.initialize()`
/// 2. Process images using `removeBackgroundFromImage()`
/// 3. Dispose when done: `BackgroundRemovalService.dispose()`
class BackgroundRemovalService {
  static bool _isInitialized = false;

  /// Initializes the ONNX runtime environment
  ///
  /// This method must be called once before using any background removal methods.
  /// It sets up the machine learning model required for background processing.
  ///
  /// Throws [Exception] if initialization fails
  ///
  /// Example:
  /// ```dart
  /// await BackgroundRemovalService.initialize();
  /// ```
  static Future<void> initialize() async {
    try {
      if (!_isInitialized) {
        await BackgroundRemover.instance.initializeOrt();
        _isInitialized = true;
        log('BackgroundRemovalService initialized successfully');
      }
    } catch (e) {
      log('Failed to initialize BackgroundRemovalService: $e');
      throw Exception('Failed to initialize background removal service: $e');
    }
  }

  /// Disposes the ONNX runtime session and releases resources
  ///
  /// Call this method when you're done using background removal functionality
  /// to free up memory and resources. Typically called in dispose() methods.
  ///
  /// Example:
  /// ```dart
  /// @override
  /// void dispose() {
  ///   BackgroundRemovalService.dispose();
  ///   super.dispose();
  /// }
  /// ```
  static void dispose() {
    if (_isInitialized) {
      BackgroundRemover.instance.dispose();
      _isInitialized = false;
      log('BackgroundRemovalService disposed');
    }
  }

  /// Removes background from image using advanced ONNX model processing
  ///
  /// This method processes the input image to remove its background with high accuracy.
  /// The result is a transparent background image that can be further processed.
  ///
  /// Parameters:
  /// - [imageFile]: Source image file to process
  /// - [backgroundColor]: Optional solid background color to apply after removal
  /// - [threshold]: Confidence threshold for background removal (0.0-1.0, default: 0.5)
  ///   * Higher values (0.7-0.9) remove more background but may affect foreground
  ///   * Lower values (0.2-0.4) preserve more foreground but may keep some background
  /// - [smoothMask]: Apply bilinear interpolation for smoother edges (default: true)
  /// - [enhanceEdges]: Use gradient-based edge enhancement for sharper boundaries (default: true)
  /// - [onProgress]: Optional callback to track processing progress (0.0-1.0)
  ///
  /// Returns [File] containing the processed image with transparent or colored background
  ///
  /// Throws [Exception] if:
  /// - Service is not initialized
  /// - Image file is invalid or corrupted
  /// - Processing fails due to memory or model errors
  ///
  /// Example:
  /// ```dart
  /// final processedFile = await BackgroundRemovalService.removeBackgroundFromImage(
  ///   imageFile,
  ///   backgroundColor: Colors.white,
  ///   threshold: 0.6,
  ///   smoothMask: true,
  ///   enhanceEdges: true,
  ///   onProgress: (progress) => print('Progress: ${(progress * 100).toInt()}%'),
  /// );
  /// ```
  static Future<File> removeBackgroundFromImage(
      File imageFile, {
        Color? backgroundColor,
        double threshold = 0.5,
        bool smoothMask = true,
        bool enhanceEdges = true,
        Function(double progress)? onProgress,
      }) async {
    try {
      // Ensure service is initialized
      if (!_isInitialized) {
        await initialize();
      }

      final stopwatch = Stopwatch()..start();

      onProgress?.call(0.1); // 10% - Starting process

      // Validate and read image bytes
      final Uint8List imageBytes = await imageFile.readAsBytes();
      log('Image loaded: ${imageBytes.length} bytes');

      onProgress?.call(0.2); // 20% - Image loaded and validated

      // Remove background using the ONNX model
      // This is the core ML processing step that analyzes the image
      // and creates a mask to separate foreground from background
      final ui.Image processedImage = await BackgroundRemover.instance.removeBg(
        imageBytes,
        threshold: threshold,
        smoothMask: smoothMask,
        enhanceEdges: enhanceEdges,
      );

      onProgress?.call(0.7); // 70% - Background successfully removed

      // Convert the UI.Image result to bytes for further processing
      Uint8List processedBytes = await _imageToBytes(processedImage);

      onProgress?.call(0.8); // 80% - Image conversion completed

      // Apply solid background color if specified
      if (backgroundColor != null) {
        processedBytes = await _applyBackgroundColor(
          processedBytes,
          backgroundColor,
        );
      }

      onProgress?.call(0.9); // 90% - Background color applied

      // Save processed image to temporary directory
      final Directory tempDir = await getTemporaryDirectory();
      final String fileName = 'bg_removed_${DateTime.now().millisecondsSinceEpoch}.png';
      final File outputFile = File(path.join(tempDir.path, fileName));

      await outputFile.writeAsBytes(processedBytes);

      stopwatch.stop();
      log('Background removal completed in ${stopwatch.elapsedMilliseconds}ms');

      onProgress?.call(1.0); // 100% - Process completed

      return outputFile;
    } catch (e) {
      log('Error in removeBackgroundFromImage: $e');
      throw Exception('Failed to remove background: $e');
    }
  }

  /// Adds a background color using the package's built-in method
  ///
  /// This method uses the package's optimized `addBackground` method which
  /// may provide better performance and quality than manual color application.
  ///
  /// Parameters:
  /// - [imageBytes]: Original image bytes (with or without background)
  /// - [backgroundColor]: Background color to apply
  ///
  /// Returns [Uint8List] containing the image with the applied background color
  ///
  /// Example:
  /// ```dart
  /// final imageWithBg = await BackgroundRemovalService.addBackgroundUsingPackage(
  ///   imageBytes,
  ///   Colors.blue,
  /// );
  /// ```
  static Future<Uint8List> addBackgroundUsingPackage(
      Uint8List imageBytes,
      Color backgroundColor,
      ) async {
    try {
      if (!_isInitialized) {
        await initialize();
      }

      return await BackgroundRemover.instance.addBackground(
        image: imageBytes,
        bgColor: backgroundColor,
      );
    } catch (e) {
      log('Error in addBackgroundUsingPackage: $e');
      throw Exception('Failed to add background using package method: $e');
    }
  }

  /// Converts ui.Image to Uint8List bytes with PNG format
  ///
  /// Internal helper method for converting Flutter's ui.Image objects
  /// to byte arrays that can be saved to files or further processed.
  ///
  /// Parameters:
  /// - [image]: The ui.Image object to convert
  ///
  /// Returns [Uint8List] containing PNG-encoded image data
  ///
  /// Throws [Exception] if conversion fails
  static Future<Uint8List> _imageToBytes(ui.Image image) async {
    try {
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      if (byteData == null) {
        throw Exception('Failed to convert image to bytes - ByteData is null');
      }

      return byteData.buffer.asUint8List();
    } catch (e) {
      log('Error converting image to bytes: $e');
      throw Exception('Failed to convert image to bytes: $e');
    }
  }

  /// Applies a solid background color to an image with transparent background
  ///
  /// This method manually composites a background color with the transparent image
  /// using Flutter's Canvas API. It provides high-quality rendering with anti-aliasing.
  ///
  /// Parameters:
  /// - [imageBytes]: Image bytes with transparent background
  /// - [backgroundColor]: Solid color to apply as background
  ///
  /// Returns [Uint8List] containing the composited image
  ///
  /// Technical details:
  /// - Uses high-quality filter settings for optimal visual results
  /// - Applies anti-aliasing for smooth edges
  /// - Preserves original image dimensions
  /// - Properly disposes of resources to prevent memory leaks
  static Future<Uint8List> _applyBackgroundColor(
      Uint8List imageBytes,
      Color backgroundColor,
      ) async {
    try {
      // Decode the transparent image
      final ui.Codec codec = await ui.instantiateImageCodec(imageBytes);
      final ui.FrameInfo frameInfo = await codec.getNextFrame();
      final ui.Image image = frameInfo.image;

      // Create a high-quality canvas for compositing
      final ui.PictureRecorder recorder = ui.PictureRecorder();
      final Canvas canvas = Canvas(recorder);

      // Configure high-quality rendering paints
      final Paint backgroundPaint = Paint()
        ..color = backgroundColor
        ..isAntiAlias = true;

      final Paint imagePaint = Paint()
        ..isAntiAlias = true
        ..filterQuality = FilterQuality.high;

      // Draw solid background first
      canvas.drawRect(
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        backgroundPaint,
      );

      // Composite the transparent image on top
      canvas.drawImage(image, Offset.zero, imagePaint);

      // Convert canvas to image
      final ui.Picture picture = recorder.endRecording();
      final ui.Image finalImage = await picture.toImage(
        image.width,
        image.height,
      );

      // Convert to bytes
      final ByteData? byteData = await finalImage.toByteData(
        format: ui.ImageByteFormat.png,
      );

      if (byteData == null) {
        throw Exception('Failed to convert composited image to bytes');
      }

      // Clean up resources to prevent memory leaks
      image.dispose();
      finalImage.dispose();
      picture.dispose();

      return byteData.buffer.asUint8List();
    } catch (e) {
      log('Error applying background color: $e');
      throw Exception('Failed to apply background color: $e');
    }
  }

  /// Gets the file size in bytes
  ///
  /// Utility method to determine the size of processed images.
  /// Useful for monitoring app storage usage and performance metrics.
  ///
  /// Parameters:
  /// - [file]: File to measure
  ///
  /// Returns [int] file size in bytes, or 0 if an error occurs
  static Future<int> getFileSize(File file) async {
    try {
      return await file.length();
    } catch (e) {
      log('Error getting file size for ${file.path}: $e');
      return 0;
    }
  }

  /// Validates if an image file is suitable for background removal processing
  ///
  /// Performs comprehensive validation including:
  /// - File existence check
  /// - File size validation (1KB - 50MB range)
  /// - Image format validation by attempting to decode
  /// - Basic corruption detection
  ///
  /// Parameters:
  /// - [file]: Image file to validate
  ///
  /// Returns [bool] true if the file is valid and processable, false otherwise
  ///
  /// Example:
  /// ```dart
  /// final isValid = await BackgroundRemovalService.validateImageFile(imageFile);
  /// if (!isValid) {
  ///   throw Exception('Selected image is invalid or corrupted');
  /// }
  /// ```
  static Future<bool> validateImageFile(File file) async {
    try {
      // Check if file exists
      if (!await file.exists()) {
        log('File does not exist: ${file.path}');
        return false;
      }

      // Check file size constraints
      final int fileSize = await file.length();
      const int minSize = 1024; // 1KB minimum
      const int maxSize = 50 * 1024 * 1024; // 50MB maximum

      if (fileSize < minSize) {
        log('File too small: ${fileSize} bytes (minimum: ${minSize} bytes)');
        return false;
      }

      if (fileSize > maxSize) {
        log('File too large: ${fileSize} bytes (maximum: ${maxSize} bytes)');
        return false;
      }

      // Validate image format by attempting to decode
      final Uint8List bytes = await file.readAsBytes();
      final ui.Codec codec = await ui.instantiateImageCodec(bytes);
      final ui.FrameInfo frameInfo = await codec.getNextFrame();

      // Clean up
      frameInfo.image.dispose();

      log('Image validation successful: ${file.path} (${fileSize} bytes)');
      return true;
    } catch (e) {
      log('Image validation failed for ${file.path}: $e');
      return false;
    }
  }

  /// Checks if the background removal service is initialized
  ///
  /// Returns [bool] true if the ONNX runtime is ready for processing
  static bool get isInitialized => _isInitialized;
}