import 'package:blog/ui/base/common/app_func.dart';
import 'package:blog/ui/base/component/app_bar_custom/app_bar_custom.dart';
import 'package:blog/ui/base/component/button/button.dart';
import 'package:blog/ui/base/component/loading/container_with_loading.dart';
import 'package:blog/ui/base/hook/use_effect_async.dart';
import 'package:blog/ui/base/hook/use_router.dart';
import 'package:blog/ui/create_blog/create_blog_view_model.dart';
import 'package:blog/ui/home/home_view_model.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/di/view_model_provider.dart';
import 'package:blog/ui/base/base_view.dart';

class CreateBlogView extends BaseView<CreateBlogViewModel> {
  // DisplayProfileResponse inforProfile;
  const CreateBlogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final enableSave = useState(false);
    final HomeViewModel homeViewModel = ref.watch(homeViewModelProvider);
    final CreateBlogViewModel viewModel =
        ref.watch(createBlogViewModelProvider);
    useEffectAsync(() async {
      print("getInforProfile");
      // await viewModel.getInforProfile();
    });

    bool checkInputsNotExistEmpty() {
      return viewModel.authorTF.text.isNotEmpty &&
          viewModel.titleTF.text.isNotEmpty &&
          viewModel.descriptionTF.text.isNotEmpty &&
          viewModel.type.isNotEmpty;
    }

    Future<void> onSave() async {
      await viewModel.createBlogNew(context, (data) {
        homeViewModel.updateIndex(0);
      });
    }

    void onChangeInut() {
      if (enableSave.value && !checkInputsNotExistEmpty()) {
        enableSave.value = false;
      }
      if (!enableSave.value && checkInputsNotExistEmpty()) {
        enableSave.value = true;
      }
    }

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
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              child: Container(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel.getImage();
                      },
                      child: viewModel.selectedImage != null
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              height: 170,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.file(
                                  viewModel.selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              height: 170,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6)),
                              width: MediaQuery.of(context).size.width,
                              child: const Icon(
                                Icons.add_a_photo,
                                color: Colors.black45,
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextField(
                            controller: viewModel.authorTF,
                            decoration:
                                const InputDecoration(hintText: "Author Name"),
                            onChanged: (String value) {
                              onChangeInut();
                            },
                          ),
                          TextField(
                            controller: viewModel.titleTF,
                            decoration:
                                const InputDecoration(hintText: "Title"),
                            onChanged: (String value) {
                              onChangeInut();
                            },
                          ),
                          TextField(
                            controller: viewModel.descriptionTF,
                            decoration: const InputDecoration(hintText: "Desc"),
                            onChanged: (String value) {
                              onChangeInut();
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text("Category: ",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                color: viewModel.type == 'Sports'
                                    ? AppColors.backgroundColorButton
                                    : Colors.white,
                                child: TextButton(
                                  onPressed: () {
                                    viewModel.choseType(0);
                                  },
                                  child: Text("Sports ",
                                      style: viewModel.type == 'Sports'
                                          ? Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                ),
                              ),
                              Container(
                                color: viewModel.type == 'Movies'
                                    ? AppColors.backgroundColorButton
                                    : Colors.white,
                                child: TextButton(
                                  onPressed: () {
                                    viewModel.choseType(1);
                                  },
                                  child: Text("Movies",
                                      style: viewModel.type == 'Movies'
                                          ? Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Button(
                            title: "Save",
                            onPress: onSave,
                            enable: enableSave.value,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
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
            "Create Blog",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // SearchView(
          //   onActionDone: (s) {
          //     print(s);
          //   },
          // ),
        ]),
      );
}
