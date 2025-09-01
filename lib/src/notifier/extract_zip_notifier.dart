import 'package:mc_utility_translater/src/notifier/file_pick_notifier.dart';
import 'package:mc_utility_translater/src/service/archive_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'extract_zip_notifier.g.dart';

@riverpod
class ExtractZipNotifier extends _$ExtractZipNotifier {
  final _archiveManager = ArchiveManager();

  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  Future<void> extractZip() async {
    state = const AsyncValue.loading();

    final file = ref.read(filePickNotifierProvider);

    if (file.value == null || file.value!.files.isEmpty) {
      state = AsyncValue.error('ファイルが選択されていません。', StackTrace.current);
      return;
    }

    final zipFilePath = file.value!.files.first.path;
    if (zipFilePath == null) {
      state = AsyncValue.error('ファイルパスがnullです。', StackTrace.current);
      return;
    }

    const destinationDirPath = 'C:/extracted_zip_files';

    try {
      await _archiveManager.extractZipFile(
        zipFilePath: zipFilePath,
        destinationDirPath: destinationDirPath,
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
