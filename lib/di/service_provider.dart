import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/service/fire_store_service.dart';
import 'package:blog/ui/setting_pages/general_pages/dart_mode/dart_mode_view.dart';

final fireStoreServiceProvider =
    ChangeNotifierProvider((ref) => FireStoreService());

// final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
