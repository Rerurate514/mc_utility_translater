import 'package:mc_utility_translater/src/const/file_suffix.dart';
import 'package:mc_utility_translater/src/notifier/file_pick_notifier.dart';
import 'package:mc_utility_translater/src/service/file_deleter.dart';
import 'package:mc_utility_translater/src/service/file_finder.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_deleter_notifier.g.dart';

@riverpod
class FileDeleterNotifier extends _$FileDeleterNotifier {
  @override
  AsyncValue<bool> build() {
    return const AsyncValue.data(false);
  }

  Future<void> delete() async {
    state = const AsyncValue.loading();

    final file = ref.read(filePickNotifierProvider);
    final zipFilePath = FileFinder.findZipFileFullPath(file.value);
    final path = withoutExtension(zipFilePath) + fileSuffix;

    try {
      FileDeleter.deleteFilesExcept(path);
      state = const AsyncValue.data(true);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
