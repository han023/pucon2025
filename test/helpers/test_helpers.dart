import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pucon2025/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pucon2025/services/localstorage_service.dart';
import 'package:pucon2025/services/fcmnoification_service.dart';
import 'package:pucon2025/services/cloudinary_service.dart';
import 'package:pucon2025/services/auth_service.dart';
import 'package:pucon2025/services/database/user_service.dart';
import 'package:pucon2025/services/database/author_service.dart';
import 'package:pucon2025/services/database/course_service.dart';
import 'package:pucon2025/services/database/notification_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocalstorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FcmnoificationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CloudinaryService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<GeminiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UserService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthorService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CourseService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<NotificationService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterLocalstorageService();
  getAndRegisterFcmnoificationService();
  getAndRegisterCloudinaryService();
  getAndRegisterGeminiService();
  getAndRegisterAuthService();
  getAndRegisterUserService();
  getAndRegisterAuthorService();
  getAndRegisterCourseService();
  getAndRegisterNotificationService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockLocalstorageService getAndRegisterLocalstorageService() {
  _removeRegistrationIfExists<LocalstorageService>();
  final service = MockLocalstorageService();
  locator.registerSingleton<LocalstorageService>(service);
  return service;
}

MockFcmnoificationService getAndRegisterFcmnoificationService() {
  _removeRegistrationIfExists<FcmnoificationService>();
  final service = MockFcmnoificationService();
  locator.registerSingleton<FcmnoificationService>(service);
  return service;
}

MockCloudinaryService getAndRegisterCloudinaryService() {
  _removeRegistrationIfExists<CloudinaryService>();
  final service = MockCloudinaryService();
  locator.registerSingleton<CloudinaryService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockUserService getAndRegisterUserService() {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  locator.registerSingleton<UserService>(service);
  return service;
}

MockAuthorService getAndRegisterAuthorService() {
  _removeRegistrationIfExists<AuthorService>();
  final service = MockAuthorService();
  locator.registerSingleton<AuthorService>(service);
  return service;
}

MockCourseService getAndRegisterCourseService() {
  _removeRegistrationIfExists<CourseService>();
  final service = MockCourseService();
  locator.registerSingleton<CourseService>(service);
  return service;
}

MockNotificationService getAndRegisterNotificationService() {
  _removeRegistrationIfExists<NotificationService>();
  final service = MockNotificationService();
  locator.registerSingleton<NotificationService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
