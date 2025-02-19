import 'file_picker_manager.dart';

abstract class FileManager {

  FileManager.create();

  factory FileManager() => FilePickerManager();

  Future<String?> getFilePdfPath();

  Future<String?> getFileImagePath();


}