import 'package:blog/data/model/remote/response/blog_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/data/model/remote/response/display_profile_response.dart';
import 'package:blog/ui/base/base_view_model.dart';

class BlogViewModel extends BaseViewModel {
  BlogViewModel(Reader reader) : super(reader);
  List<BlogResponse>? dataBlogs;
  String type = '';
  Stream<QuerySnapshot>? blogsStream;
  getBlogs(String? type, String? mail) async {
    setBusy(true);
    await appApiHelper.getBlog('blogs', type, mail, (data) {
      print(data);
      blogsStream = data;
      setBusy(false);
    });
    setBusy(false);
  }

  choseType(int i) async {
    switch (i) {
      case 0:
        type = 'Sports';
        await getBlogs(type, null);
        notifyListeners();
        break;
      case 1:
        type = 'Movies';
        await getBlogs(type, null);
        notifyListeners();
        break;
      default:
        type = '';
        await getBlogs(null, null);
        notifyListeners();
        break;
    }
  }
}
