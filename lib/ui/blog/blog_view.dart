import 'package:blog/ui/base/common/app_func.dart';
import 'package:blog/ui/base/common/network_image.dart';
import 'package:blog/ui/base/common/search_view.dart';
import 'package:blog/ui/base/component/app_bar_custom/app_bar_custom.dart';
import 'package:blog/ui/base/component/loading/container_with_loading.dart';
import 'package:blog/ui/base/hook/use_effect_async.dart';
import 'package:blog/ui/base/hook/use_router.dart';
import 'package:blog/ui/blog/blog_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/di/view_model_provider.dart';
import 'package:blog/ui/base/base_view.dart';
import 'package:blog/ui/themes/app_color.dart';

class BlogView extends BaseView<BlogViewModel> {
  // DisplayProfileResponse inforProfile;
  const BlogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final BlogViewModel blogViewModel = ref.watch(blogViewModelProvider);
    useEffectAsync(() async {
      print("getInforProfile");
      await blogViewModel.getBlogs(null, null);
    });
    return Scaffold(
      appBar: AppBarCustom(
        height: 0,
      ),
      body: SafeArea(
        child: ContainerWithLoading(
          provider: settingViewModelProvider,
          child: GestureDetector(
            onTap: (() => AppFunc.hideKeyboard(context)),
            child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.manual,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SearchView(
                        onActionDone: (s) {
                          blogViewModel.getBlogs(null, s);
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: blogViewModel.type == ''
                                ? AppColors.backgroundColorButton
                                : Theme.of(context).backgroundColor,
                            child: TextButton(
                              onPressed: () {
                                blogViewModel.choseType(2);
                              },
                              child: Text("All",
                                  style: blogViewModel.type == 'Movies'
                                      ? Theme.of(context).textTheme.titleMedium
                                      : Theme.of(context).textTheme.bodyMedium),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: blogViewModel.type == 'Sports'
                                ? AppColors.backgroundColorButton
                                : Theme.of(context).backgroundColor,
                            child: TextButton(
                              onPressed: () {
                                blogViewModel.choseType(0);
                              },
                              child: Text("Sports ",
                                  style: blogViewModel.type == 'Sports'
                                      ? Theme.of(context).textTheme.titleMedium
                                      : Theme.of(context).textTheme.bodyMedium),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: blogViewModel.type == 'Movies'
                                ? AppColors.backgroundColorButton
                                : Theme.of(context).backgroundColor,
                            child: TextButton(
                              onPressed: () {
                                blogViewModel.choseType(1);
                              },
                              child: Text("Movies",
                                  style: blogViewModel.type == 'Movies'
                                      ? Theme.of(context).textTheme.titleMedium
                                      : Theme.of(context).textTheme.bodyMedium),
                            ),
                          ),
                        ),
                      ],
                    ),
                    blogViewModel.blogsStream != null
                        ? StreamBuilder<QuerySnapshot>(
                            stream: blogViewModel.blogsStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Something went wrong');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text("Loading");
                              }

                              return ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                reverse: true,
                                shrinkWrap: true,
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  Map<String, dynamic> data =
                                      document.data()! as Map<String, dynamic>;
                                  return BlogsTile(
                                    authorName: data['authorName'],
                                    description: data['desc'],
                                    imgUrl: data['imgUrl'] ??
                                        'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/03_2019/nhung-bai-bien-dep-nhat-viet-nam-2.jpg',
                                    title: data['title'],
                                  );
                                }).toList(),
                              );
                            },
                          )
                        : Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  buildItem(BuildContext context) => Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.only(top: 43, left: 24, right: 24, bottom: 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Blog",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ]),
      );
}

class BlogsTile extends StatelessWidget {
  String imgUrl, title, description, authorName;
  BlogsTile(
      {required this.imgUrl,
      required this.title,
      required this.description,
      required this.authorName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 150,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CustomNetworkImage(
              image: imgUrl,
              width: MediaQuery.of(context).size.width,
              height: 100,
            ),
          ),
          Container(
            height: 170,
            decoration: BoxDecoration(
                color: Colors.black45.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(authorName)
              ],
            ),
          )
        ],
      ),
    );
  }
}
