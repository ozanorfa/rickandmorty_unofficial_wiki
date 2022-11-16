import 'dart:io';

import 'string_templates.dart';
import 'utils.dart';

void main(List<String> args) {
  stdout.write('Enter a view name (use snake case): ');
  final snakeViewName = stdin.readLineSync()!.trim();

  if (snakeViewName.isEmpty) {
    stdout.writeln('Entered name should not be empty!');
  } else {
    bool openFilesAfterCreated = false;
    if (args.contains('--open') || args.contains('-o')) {
      openFilesAfterCreated = true;
    } else if (args.contains('--no-open') || args.contains('-n')) {
      openFilesAfterCreated = false;
    }
    createViewFiles(
      snakeViewName,
      openFilesAfterCreated: openFilesAfterCreated,
    );
  }
}

void createViewFiles(
  String snakeViewName, {
  required bool openFilesAfterCreated,
}) {
  const String appPath = '../lib/app';

  final viewPath = '$appPath/views/$snakeViewName';

  final viewFile = File('$viewPath/${snakeViewName}_view.dart')
    ..createSync(recursive: true);

  final viewModelFile = File('$viewPath/${snakeViewName}_view_model.dart')
    ..createSync(recursive: true);

  viewFile.writeAsStringSync(
    StringTemplates.viewTemplate
        .replaceAll('{SNAKE_NAME}', snakeViewName)
        .replaceAll('{VIEW_NAME}', snakeViewName.snakeToPascalCase()),
  );

  viewModelFile.writeAsStringSync(
    StringTemplates.viewModelTemplate
        .replaceAll('{VIEW_NAME}', snakeViewName.snakeToPascalCase()),
  );

  if (openFilesAfterCreated) {
    Process.runSync(
      'code',
      [
        '-r',
        viewFile.path,
        viewModelFile.path,
      ],
    );
  }
}
