// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/auth_service.dart';
import '../services/cloudinary_service.dart';
import '../services/database/author_service.dart';
import '../services/database/course_service.dart';
import '../services/database/notification_service.dart';
import '../services/database/user_service.dart';
import '../services/fcmnoification_service.dart';
import '../services/localstorage_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LocalstorageService());
  locator.registerLazySingleton(() => FcmnoificationService());
  locator.registerLazySingleton(() => CloudinaryService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => AuthorService());
  locator.registerLazySingleton(() => CourseService());
  locator.registerLazySingleton(() => NotificationService());
}
