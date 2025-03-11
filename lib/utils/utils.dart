// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

// pickImage() async {
//   FilePickerResult? pickedImage =
//       await FilePicker.platform.pickFiles(type: FileType.image);
//   if (pickedImage != null) {
//     return await File(pickedImage.files.single.path!).readAsBytes();
//   }
// }
