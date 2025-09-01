import 'package:file_picker/file_picker.dart';

class FilePickerManager {
  Future<FilePickerResult?> pickSingleFile() async {
    final FilePicker filePicker = FilePicker.platform;
    final FilePickerResult? result = await filePicker.pickFiles(allowMultiple: false);
    return result;
  }
}
