import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_pick_notifier.g.dart';

@riverpod
class FilePickNotifier extends _$FilePickNotifier {
  @override
  AsyncValue<FilePickerResult?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> pickSingleFile() async {
    state = const AsyncValue.loading();
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
      );

      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
