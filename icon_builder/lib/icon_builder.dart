import 'dart:async';
import 'dart:io';

import 'package:build/build.dart';

class IconBuilder implements Builder {
  @override
  final buildExtensions = const {
    'icons_placeholder.dart': ['app_icons.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    if (!buildStep.inputId.path.contains('icons_placeholder.dart')) return;

    final iconDir = Directory('assets/icons');
    if (!iconDir.existsSync()) {
      log.warning('⚠️ icons folder not found at assets/icons');
      return;
    }

    final svgFiles = iconDir.listSync().whereType<File>().where((file) => file.path.endsWith('.svg'));

    final buffer = StringBuffer();
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln('class AppIcons {');

    for (final file in svgFiles) {
      final fileName = file.uri.pathSegments.last.replaceAll('.svg', '');
      final pascalName = _toPascalCase(fileName);
      final variableName = 'k$pascalName';
      final assetPath = file.path.replaceAll('\\', '/');
      buffer.writeln("  static const String $variableName = '$assetPath';");
    }

    buffer.writeln('}');

    final outputId = AssetId(
      buildStep.inputId.package,
      'lib/generated/app_icons.dart',
    );

    await buildStep.writeAsString(outputId, buffer.toString());
  }

  String _toPascalCase(String input) {
    return input
        .replaceAll(RegExp(r'[^a-zA-Z0-9]'), ' ')
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join();
  }
}
