import 'package:blog/ui/auth_pages/register/register_view_model.dart';
import 'package:blog/ui/auth_pages/splash/splash_view_model.dart';
import 'package:blog/ui/blog/blog_view_model.dart';
import 'package:blog/ui/create_blog/create_blog_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/home/home_view_model.dart';
import 'package:blog/ui/auth_pages/login/login_view_model.dart';
import 'package:blog/ui/setting_pages/general_pages/dart_mode/dart_mode_view_model.dart';
import 'package:blog/ui/setting_pages/setting/setting_view_model.dart';

final loginViewModelProvider =
    ChangeNotifierProvider<LoginViewModel>((ref) => LoginViewModel(
          ref.read,
        ));

final registerViewModelProvider =
    ChangeNotifierProvider<RegisterViewModel>((ref) => RegisterViewModel(
          ref.read,
        ));

final splashViewModelProvider =
    ChangeNotifierProvider<SplashViewModel>((ref) => SplashViewModel(ref.read));

final homeViewModelProvider =
    ChangeNotifierProvider<HomeViewModel>((ref) => HomeViewModel(
          ref.read,
        ));
final settingViewModelProvider =
    ChangeNotifierProvider<SettingViewModel>((ref) => SettingViewModel(
          ref.read,
        ));
final blogViewModelProvider =
    ChangeNotifierProvider<BlogViewModel>((ref) => BlogViewModel(
          ref.read,
        ));

final createBlogViewModelProvider =
    ChangeNotifierProvider<CreateBlogViewModel>((ref) => CreateBlogViewModel(
          ref.read,
        ));

final dartModeViewModelProvider = ChangeNotifierProvider<DartModeViewViewModel>(
    (ref) => DartModeViewViewModel(
          ref.read,
        ));
