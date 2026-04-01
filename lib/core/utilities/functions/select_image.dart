import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../image_helper.dart';

Future<XFile?> selectImage(BuildContext context) async {
  final XFile? file = await ImageHelper.pickImageWithChoice(context);
  if (file != null) {
    print("Picked image path: ${file.path}");
    return file;
  }
  print("No image selected");
  return null;
}
