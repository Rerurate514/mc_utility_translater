import 'package:mc_utility_translater/src/const/file_suffix.dart';
import 'package:mc_utility_translater/src/service/file_finder.dart';
import 'package:path/path.dart' as p;
import 'package:mc_utility_translater/src/notifier/file_pick_notifier.dart';
import 'package:mc_utility_translater/src/service/archive_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'extract_zip_notifier.g.dart';

@riverpod
class ExtractZipNotifier extends _$ExtractZipNotifier {
  final _archiveManager = ArchiveManager();

  @override
  AsyncValue<bool> build() {
    return const AsyncValue.data(false);
  }

  Future<void> extractZip() async {
    state = const AsyncValue.loading();

    final file = ref.read(filePickNotifierProvider);
    final zipFilePath = FileFinder.findZipFileFullPath(file.value);

    try {
      final parentDir = p.dirname(zipFilePath);
      final newDirName = "${p.basenameWithoutExtension(zipFilePath)}$fileSuffix";
      final destinationDirPath = p.join(parentDir, newDirName);

      await _archiveManager.extractZipFile(
        zipFilePath: zipFilePath,
        destinationDirPath: destinationDirPath,
      );
      state = const AsyncValue.data(true);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
