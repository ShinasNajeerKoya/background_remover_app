import 'dart:io';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class PermissionService {
  /// Unified method to request photo/media permissions (Android & iOS)
  static Future<PermissionState> requestMediaPermission() async {
    final result = await PhotoManager.requestPermissionExtend();
    return result;
  }

  /// Check if media permission is granted using photo_manager
  static Future<bool> isMediaPermissionGranted() async {
    final result = await PhotoManager.requestPermissionExtend();
    return result.isAuth;
  }

  /// Opens app settings
  static Future<void> openPermissionSettings() async {
    await PhotoManager.openSetting();
  }


  /// Handles permission result from PhotoManager
  static Future<void> handleMediaPermissionResult({
    required PermissionState result,
    VoidCallback? onGranted,
    VoidCallback? onDenied,
  }) async {
    if (result.isAuth) {
      onGranted?.call();
    } else {
      onDenied?.call();
    }
  }
}
