import 'dart:io';

import 'utils.dart';

void main(List<String> args) {
  generateAssets();
}

void generateAssets() {
  const String appPath = '../lib/app';
  const String assetsPath = '../assets';
  final StringBuffer assetFileContent = StringBuffer();

  assetFileContent.writeln(
    '''/// GENERATED CODE - DO NOT MODIFY BY HAND [gen_assets.dart]
''',
  );

  final List<String> folders = ['images'];

  assetFileContent.writeln('mixin AppAssets {');
  assetFileContent.writeln('  // Base Asset Paths');

  for (final folder in folders) {
    final assets = Directory('$assetsPath/$folder/').listSync()
      ..removeWhere((asset) => asset.path.contains('.DS_Store'));

    assetFileContent.writeln(
        '''  ${assets.isEmpty ? '// ' : ''}static const String _base${folder.pluralToSingular().toFirstUpperCase()}Path = 'assets/$folder';''');
  }

  for (final folder in folders) {
    assetFileContent.writeln();

    assetFileContent.writeln('  // ${folder.toUpperCase()}');

    final rawAssets = Directory('$assetsPath/$folder/').listSync();
    rawAssets.removeWhere((asset) => asset.path.contains('.DS_Store'));

    if (rawAssets.isEmpty) {
      continue;
    }
    final List<String> assets =
        rawAssets.map((e) => e.path.split('/').last).toList()..sortByLength();

    for (final asset in assets) {
      assetFileContent.write(
        '''
  static const String ${(asset.split('.').first).snakeToCamelCase()} = '\$_base${folder.pluralToSingular().toFirstUpperCase()}Path/$asset';
''',
      );
    }
  }

  assetFileContent.writeln('}');

  writeFile('$appPath/constants/app_assets.dart', assetFileContent.toString());
}
