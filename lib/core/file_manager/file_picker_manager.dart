import 'package:file_picker/file_picker.dart';
import 'file_manager.dart';

class FilePickerManager extends FileManager {

  FilePickerManager._():super.create();

  static FilePickerManager? _instance;

  factory FilePickerManager() => _instance ??= FilePickerManager._();

  @override
  Future<String?> getFileImagePath() async{
    var path = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false
    );
    return path?.files.firstOrNull?.path;
  }

  @override
  Future<String?> getFilePdfPath() async{
    var path = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf'],
        type: FileType.custom,
        allowMultiple: false
    );
    return path?.files.firstOrNull?.path;
  }

}