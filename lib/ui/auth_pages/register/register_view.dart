import 'package:blog/ui/auth_pages/auth_view/text_input_password.dart';
import 'package:blog/ui/auth_pages/register/register_view_model.dart';
import 'package:blog/ui/base/component/button/button.dart';
import 'package:blog/ui/base/component/loading/container_with_loading.dart';
import 'package:blog/ui/base/hook/use_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/di/view_model_provider.dart';
import 'package:blog/ui/base/base_view.dart';
import 'package:blog/ui/auth_pages/login/login_view_model.dart';
import 'package:blog/ui/themes/text_styles.dart';
import 'package:blog/ui/utils/show_modal.dart';

class RegisterView extends BaseView<RegisterViewModel> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    // final trans = useLocalizations();
    final TextEditingController mailController = useTextEditingController();
    // final TextEditingController nameController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    final enableLogin = useState(false);
    final RegisterViewModel registerViewModel =
        ref.watch(registerViewModelProvider);

    bool checkInputsNotExistEmpty() {
      return mailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    }

    void onChangeInut() {
      if (enableLogin.value && !checkInputsNotExistEmpty()) {
        enableLogin.value = false;
      }
      if (!enableLogin.value && checkInputsNotExistEmpty()) {
        enableLogin.value = true;
      }
    }

    Future<void> onRegister() async {
      await registerViewModel.tapRegister(
          mailController.text.trim(), passwordController.text, context);
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: ContainerWithLoading<LoginViewModel>(
              provider: loginViewModelProvider,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SizedBox(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.manual,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Register Blog",
                              style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 50),
                          TextInputPassword(
                            controller: mailController,
                            hintText: "mail",
                            securityType: InputSecurityType.email,
                            onChanged: (String value) {
                              onChangeInut();
                            },
                          ),
                          const SizedBox(height: 16),
                          // TextInputPassword(
                          //   controller: nameController,
                          //   hintText: "your name",
                          //   securityType: InputSecurityType.email,
                          //   onChanged: (String value) {
                          //     onChangeInut();
                          //   },
                          // ),
                          // const SizedBox(height: 16),
                          TextInputPassword(
                            hintText: "password",
                            controller: passwordController,
                            securityType: InputSecurityType.password,
                            onChanged: (String value) {
                              onChangeInut();
                            },
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(height: 28),
                          Button(
                            title: "Register",
                            onPress: onRegister,
                            enable: enableLogin.value,
                          ),
                          const SizedBox(height: 28),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Login Now",
                                  style: TextStyles
                                      .regularText14.colorPrimaryGray
                                      .copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))),
    );
  }
}
