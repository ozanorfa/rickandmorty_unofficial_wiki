import 'dart:convert';
import 'dart:io';

dynamic readFile({required String path, bool isJson = false}) {
  final file = File(path);

  final String result = file.readAsStringSync();

  if (isJson) return json.decode(result);

  return result;
}

void writeFile(String path, String data) {
  final File file = File(path);

  file.writeAsStringSync(data);
}

extension StringExtensions on String {
  String toFirstUpperCase() => this[0].toUpperCase() + substring(1);
  String toFirstLowerCase() => this[0].toLowerCase() + substring(1);

  bool isUpperCase() => this == toUpperCase();

  String snakeToPascalCase() {
    final words = split('_');

    return words.map((word) {
      if (word.toLowerCase().contains('webview')) {
        return word.replaceAll('webview', 'WebView');
      }

      return word.toFirstUpperCase();
    }).join();
  }

  String snakeToCamelCase() {
    final words = split('_');

    for (int i = 0; i < words.length; i++) {
      if (i == 0) {
        if (words[i].toLowerCase().contains('webview')) {
          words[i] = words[i].replaceAll('webview', 'webView');
        }
        continue;
      }

      if (words[i].toLowerCase().contains('webview')) {
        words[i] = words[i].replaceAll('webview', 'WebView');
      } else {
        words[i] = words[i].toFirstUpperCase();
      }
    }

    return words.join();
  }

  String snakeToKebabCase() {
    return toLowerCase().replaceAll('_', '-');
  }

  String snakeToTitleCase() {
    final words = split('_');

    return words.map((word) {
      if (word.toLowerCase().contains('webview')) {
        return word.replaceAll('webview', 'WebView');
      }

      return word.toFirstUpperCase();
    }).join(' ');
  }

  String removeSpaces() => replaceAll(' ', '');

  String toSnakeCase() {
    String snakeCasedText = removeSpaces();

    for (int i = 0; i < snakeCasedText.length; i++) {
      if (snakeCasedText[i].isUpperCase()) {
        snakeCasedText = snakeCasedText.replaceRange(
          i,
          i + 1,
          '${i != 0 ? '_' : ''}${snakeCasedText[i].toLowerCase()}',
        );
      }
    }

    snakeCasedText = snakeCasedText.replaceAll('/', '');
    snakeCasedText = snakeCasedText.replaceAll('web_view', 'webview');

    return snakeCasedText;
  }

  String snakeToRouteCase() => '/${snakeToCamelCase()}';

  String pluralToSingular() {
    if (endsWith('s')) {
      return substring(0, length - 1);
    } else {
      return this;
    }
  }
}

extension ListExtensions on List {
  void sortByLength() => sort((a, b) => a.length.compareTo(b.length));
}

extension IterableExtensions on Iterable {
  List<String> toMarkdownList() => map((e) => '`${e.toString()}`').toList();
}

String getAppVersion() {
  const filePath = '../pubspec.yaml';

  final List<String> pubspecFile =
      readFile(path: filePath).split('\n').toList();

  const text = 'version: ';

  for (final line in pubspecFile) {
    if (line.contains(text)) {
      final String appVersion = line.trim().replaceAll(text, '');
      return appVersion;
    }
  }

  // This should never happen.
  return '-';
}
