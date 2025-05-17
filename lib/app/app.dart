import 'package:pucon2025/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:pucon2025/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:pucon2025/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pucon2025/services/localstorage_service.dart';
import 'package:pucon2025/services/fcmnoification_service.dart';
import 'package:pucon2025/services/cloudinary_service.dart';
import 'package:pucon2025/services/auth_service.dart';
import 'package:pucon2025/services/database/user_service.dart';
import 'package:pucon2025/ui/views/auth/login/login_view.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_view.dart';
import 'package:pucon2025/ui/views/auth/forgetpass/forgetpass_view.dart';
import 'package:pucon2025/ui/views/home/home_view.dart';
import 'package:pucon2025/services/database/author_service.dart';
import 'package:pucon2025/services/database/course_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: ForgetpassView),
    MaterialRoute(page: HomeView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LocalstorageService),
    LazySingleton(classType: FcmnoificationService),
    LazySingleton(classType: CloudinaryService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: AuthorService),
    LazySingleton(classType: CourseService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
