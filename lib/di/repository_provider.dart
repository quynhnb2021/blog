import 'package:blog/data/model/local/app_preferences_helper.dart';
import 'package:blog/data/repository/firebase_manage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseManageProvider = Provider((ref) => FirebaseManager(ref.read));

final sharedPrefProvider = Provider((_) => AppPreferencesHelper());
