import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../model/UserModel.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/database/user_service.dart';
import '../../../../services/localstorage_service.dart';
import '../../../common/constants/app_strings.dart';
import '../../../common/constants/helper_functions.dart';
import '../signup/signup_view.dart';

class LoginViewModel extends BaseViewModel {
  final _auth = locator<AuthService>();
  final _localstorage = locator<LocalstorageService>();
  final _user = locator<UserService>();
  final _navigationService = locator<NavigationService>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool obsure = true;

  void toggle() {
    obsure = !obsure;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    final emailText = email.text.trim();
    final passwordText = password.text;

    if (emailText.isEmpty || passwordText.isEmpty) {
      show_snackbar(context, "Fill All Fields");
      return;
    }

    displayprogress(context);

    try {
      UserCredential credential = await _auth.signIn(emailText, passwordText);

      final user = credential.user;
      if (user == null) {
        show_snackbar(context, "No User Found");
        return;
      }

      if (!user.emailVerified) {
        show_snackbar(context, "Email Not Verified");
        return;
      }

      UserModel? value = await _user.getUserDetailViaEmail(emailText);
      if (value == null) {
        show_snackbar(context, "No User Found");
        return;
      }

      _localstorage.setString(uid, value.uid);
      _localstorage.setString("cat", value.cat);
      _localstorage.setString(id, value.id);
      _localstorage.setString(auth, "true");
      _user.updateNotificationId(value.id);

      // if (value.cat == "doctor") {
      //   _navigationService.clearStackAndShow(Routes.doctorView);
      //   _navigationService.replaceWithTransition(
      //     const DoctorView(),
      //     routeName: Routes.doctorView,
      //     transitionStyle: Transition.rightToLeft,
      //   );
      // } else {
      //   _navigationService.clearStackAndShow(Routes.userView);
      //   _navigationService.replaceWithTransition(
      //     const UserView(),
      //     routeName: Routes.userView,
      //     transitionStyle: Transition.rightToLeft,
      //   );
      // }
    } on FirebaseAuthException catch (e) {
      show_snackbar(context, e.message ?? "Authentication Error");
    } catch (e) {
      show_snackbar(context, "An unexpected error occurred");
    } finally {
      hideprogress(context);
    }
  }

  void signup(BuildContext context) {
    navigateToView(const SignupView(), Routes.signupView);
  }
}
