import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerProvider with ChangeNotifier{
  PlatformFile? userImg;

  Future<void> pickUserImg()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      //allowedExtensions: ['jpg', 'pdf', 'doc'],
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      PlatformFile file= result.files.single;
      userImg = file;
      notifyListeners();
    } else {
      // User canceled the picker
    }
  }
}