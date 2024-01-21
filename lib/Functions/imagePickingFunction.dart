import 'package:image_picker/image_picker.dart';

Future<String> selectPicture({required XFile? file, required ImageSource imageSource})async{
  final ImagePicker picker = ImagePicker();
  file = await picker.pickImage(source: imageSource);
  if (file != null) {
    return file.path;
  }
  return '';
}