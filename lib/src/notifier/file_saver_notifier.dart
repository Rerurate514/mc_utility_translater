import 'package:mc_utility_translater/src/notifier/file_pick_notifier.dart';
import 'package:mc_utility_translater/src/notifier/json_editor_controller_notifier.dart';
import 'package:mc_utility_translater/src/service/file_finder.dart';
import 'package:mc_utility_translater/src/service/file_saver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_saver_notifier.g.dart';

@riverpod
class FileSaverNotifier extends _$FileSaverNotifier {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }
  
  Future<void> save() async {
    state = AsyncLoading();

    final file = ref.read(filePickNotifierProvider);
    final langPath = FileFinder.findLangPath(file.value);

    if(langPath == null) {
      state = AsyncError("言語ファイルが見つかりません。", StackTrace.current);
      return;
    }

    final content = ref.read(jsonEditorControllerNotifierProvider).text;
    FileSaver.saveStringToFile(langPath, content);

    state = AsyncData(null);
  }
}
