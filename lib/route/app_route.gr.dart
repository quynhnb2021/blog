// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:blog/ui/auth_pages/login/login_view.dart' as _i2;
import 'package:blog/ui/auth_pages/register/register_view.dart' as _i3;
import 'package:blog/ui/auth_pages/splash/splash_view.dart' as _i1;
import 'package:blog/ui/home/home_view.dart' as _i7;
import 'package:blog/ui/setting_pages/abouts/about/about_view.dart' as _i5;
import 'package:blog/ui/setting_pages/general_pages/dart_mode/dart_mode_view.dart'
    as _i6;
import 'package:blog/ui/setting_pages/setting/setting_view.dart' as _i4;
import 'package:flutter/material.dart' as _i9;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    LoginRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginView());
    },
    RegisterRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.RegisterView());
    },
    SettingRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.SettingView());
    },
    AboutRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.AboutView());
    },
    DartModeRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.DartModeView());
    },
    HomeRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.HomeView(),
          transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashRoute.name, path: '/'),
        _i8.RouteConfig(LoginRoute.name, path: '/login-view'),
        _i8.RouteConfig(RegisterRoute.name, path: '/register-view'),
        _i8.RouteConfig(SettingRoute.name, path: '/setting-view'),
        _i8.RouteConfig(AboutRoute.name, path: '/about-view'),
        _i8.RouteConfig(DartModeRoute.name, path: '/dart-mode-view'),
        _i8.RouteConfig(HomeRoute.name, path: '/home-view')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginView]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-view');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterView]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-view');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.SettingView]
class SettingRoute extends _i8.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: '/setting-view');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i5.AboutView]
class AboutRoute extends _i8.PageRouteInfo<void> {
  const AboutRoute() : super(AboutRoute.name, path: '/about-view');

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i6.DartModeView]
class DartModeRoute extends _i8.PageRouteInfo<void> {
  const DartModeRoute() : super(DartModeRoute.name, path: '/dart-mode-view');

  static const String name = 'DartModeRoute';
}

/// generated route for
/// [_i7.HomeView]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-view');

  static const String name = 'HomeRoute';
}
