import 'package:blog/route/app_route.gr.dart';
import 'package:blog/ui/themes/theme_dark.dart';
import 'package:blog/ui/themes/theme_light.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//flutter pub run build_runner build --delete-conflicting-outputs

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Ideal time to initialize
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  // await dotenv.load(fileName: kReleaseMode ? ".env-release" : ".env-dev");
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends HookConsumerWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Locale setLanguage(String l) {
    //   switch (l) {
    //     case '简体中文':
    //       return const Locale('zh', 'CN');
    //     case 'Bahasa Melayu':
    //       return const Locale('ms', 'MY');

    //     default:
    //       return const Locale('en', 'EN');
    //   }
    // }

    final appRouter = useMemoized(() => AppRouter());

    return MaterialApp.router(
      theme: AppThemeLight().getTheme(),
      darkTheme: AppThemeDark().getTheme(),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
