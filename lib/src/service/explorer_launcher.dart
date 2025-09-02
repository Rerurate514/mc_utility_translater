import 'dart:io';

class ExplorerLauncher {
  static void openExplorer(String? path) {
    String command;
    List<String> args;

    if (path != null && path.isNotEmpty) {
      command = 'explorer';
      args = [path];
    } else {
      command = 'explorer';
      args = [];
    }
    
    try {
      Process.runSync(command, args);
    } on ProcessException catch (e) {
      throw Exception('Failed to open Explorer: ${e.message}');
    }
  }
}
