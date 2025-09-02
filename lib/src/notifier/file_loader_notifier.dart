import 'package:mc_utility_translater/src/notifier/file_pick_notifier.dart';
import 'package:mc_utility_translater/src/service/file_finder.dart';
import 'package:mc_utility_translater/src/service/file_loader.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_loader_notifier.g.dart';

@riverpod
class FileLoaderNotifier extends _$FileLoaderNotifier {
  final _fileLoader = FileLoader();

  @override
  AsyncValue<String> build() {
    return const AsyncValue.data('');
  }

  Future<void> loadFile() async {
    state = const AsyncValue.loading();

    final file = ref.read(filePickNotifierProvider);
    final zipFilePath = FileFinder.findZipFileFullPath(file.value);

    try {
      final fileContent = _fileLoader.load(zipFilePath);
      state = AsyncValue.data(fileContent);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void updateJson(String newJson) {
    state = AsyncValue.data(newJson);
  }
}
