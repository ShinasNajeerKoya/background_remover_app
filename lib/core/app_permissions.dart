import 'package:background_remover_app/core/services/permission_service.dart';
import 'package:photo_manager/photo_manager.dart';

/// Utility class containing permission-related constants and helper methods
class AppPermissions {
  AppPermissions._();

  static const String permissionDeniedMessage =
      'Media access permission is required to access your images.';
  static const String permissionPermanentlyDeniedMessage =
      'Media access is permanently denied. Please enable it from app settings.';

  /// Request media/gallery permission with proper error handling
  ///
  /// Returns [PermissionResult] containing status and message
  static Future<PermissionResult> requestMediaWithFeedback() async {
    try {
      final result = await PermissionService.requestMediaPermission();

      if (result == PermissionState.authorized || result == PermissionState.limited) {
        return const PermissionResult(
          isGranted: true,
          status: MediaPermissionStatus.granted,
          message: 'Permission granted successfully',
        );
      } else if (result == PermissionState.denied) {
        // We can't detect "permanently denied" via photo_manager alone.
        return const PermissionResult(
          isGranted: false,
          status: MediaPermissionStatus.denied,
          message: AppPermissions.permissionDeniedMessage,
        );
      } else {
        return const PermissionResult(
          isGranted: false,
          status: MediaPermissionStatus.error,
          message: 'Unknown permission status',
        );
      }
    } catch (e) {
      return PermissionResult(
        isGranted: false,
        status: MediaPermissionStatus.error,
        message: 'Error requesting permission: $e',
      );
    }
  }
}

/// Result class for permission operations
class PermissionResult {
  final bool isGranted;
  final MediaPermissionStatus status;
  final String message;

  const PermissionResult({
    required this.isGranted,
    required this.status,
    required this.message,
  });
}

/// Enum for clearer permission status
enum MediaPermissionStatus {
  granted,
  denied,
  permanentlyDenied,
  error,
}
