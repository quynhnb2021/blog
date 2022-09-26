import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/base/base_view_model.dart';
import 'package:image_picker/image_picker.dart';

class CreateBlogViewModel extends BaseViewModel {
  CreateBlogViewModel(Reader reader) : super(reader);

  final authorTF = TextEditingController();
  final titleTF = TextEditingController();
  final descriptionTF = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String type = 'Sports';
  String urlImg = '';
  File? selectedImage;
  Future<bool> getImage() async {
    // setBusy(true);
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // setBusy(false);
    if (image != null) {
      selectedImage = File(image.path);
      await appApiHelper.uploadImage(selectedImage!, (data) {
        print(data);
        urlImg = data;
      });
      notifyListeners();

      return true;
    }
    return false;
  }

  createBlogNew(BuildContext context, Function callback) async {
    setBusy(true);
    final mail = await sharedPref.getMail();
    await appApiHelper.createBlog('blogs', mail, urlImg, authorTF.text,
        titleTF.text, descriptionTF.text, type, context, (data) {
      print(data);
      setBusy(false);
      Fluttertoast.showToast(msg: 'Create Blog successfully');
      authorTF.text = '';
      titleTF.text = '';
      descriptionTF.text = '';
      callback.call(true);
      // Navigator.pop(context);
    });
    setBusy(false);
  }

  choseType(int i) {
    i == 0 ? type = 'Sports' : type = 'Movies';
    notifyListeners();
  }
}
