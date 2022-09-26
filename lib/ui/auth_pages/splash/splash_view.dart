import 'package:blog/route/app_route.gr.dart';
import 'package:blog/ui/base/hook/use_effect_async.dart';
import 'package:blog/ui/base/hook/use_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/data/model/remote/response/blog_response.dart';
import 'package:blog/di/view_model_provider.dart';
import 'package:blog/ui/auth_pages/splash/splash_view_model.dart';
import 'package:blog/ui/themes/text_styles.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    // final SplashViewModel viewModel = ref.watch(splashViewModelProvider);

    useEffectAsync(
        () => Future.delayed(const Duration(milliseconds: 2000), () async {
              router.push(const LoginRoute());
            }));
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              // Image.asset(
              //   "assets/icons/login/loading_11.png",
              //   width: 178,
              //   height: 188,
              // ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Blog App",
                style: TextStyles.boldText36.colorPrimaryBlack,
              ),
              Text(
                "Reading for fun",
                style: TextStyles.regularText14.w400.colorPrimaryGray,
              ),
              const Spacer(),
              Text(
                "Copyright © 2020-2022 Blog App\n All Rights Reserved.",
                textAlign: TextAlign.center,
                style: TextStyles.regularText14.w400.colorPrimaryGray,
              ),
            ]),
      ),
    );
  }
}
