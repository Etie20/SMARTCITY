import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImage({ImageSource source = ImageSource.gallery}) async {
  try {
    final xfile = await ImagePicker().pickImage(
      source: source,
    );

    if (xfile != null) {
      return File(xfile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}
