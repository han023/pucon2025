import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pucon2025/services/fcmnoification_service.dart';
import 'package:pucon2025/services/localstorage_service.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../model/UserModel.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/database/user_service.dart';
import '../../../common/constants/helper_functions.dart';
import '../login/login_view.dart';

class SignupViewModel extends BaseViewModel {
  final _auth = locator<AuthService>();
  final _user = locator<UserService>();
  final _fcm = locator<FcmnoificationService>();
  final _localstorage = locator<LocalstorageService>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  bool verify = false;
  bool obsure = true;

  void toggle() {
    obsure = !obsure;
    notifyListeners();
  }

  Future<void> signup(BuildContext context) async {
    final emailText = email.text.trim();
    final passwordText = password.text;
    final nameText = name.text.trim();

    if (emailText.isEmpty || passwordText.isEmpty || nameText.isEmpty) {
      show_snackbar(context, "Fill All Fields");
      return;
    }

    displayprogress(context);
    try {
      UserCredential userCredential =
          await _auth.register(emailText, passwordText);

      await userCredential.user!.sendEmailVerification();

      final token = await _fcm.fcmToken();

      final data = UserModel(
        id: '',
        uid: userCredential.user!.uid,
        email: emailText,
        notificationId: token ?? '',
        name: nameText,
      );
      await _user.saveNewUser(data);
      _localstorage.setString(auth, "false");

      verify = true;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        show_snackbar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        show_snackbar(context, 'The account already exists for that email.');
      } else {
        show_snackbar(context, 'Something went wrong. Please try again later.');
      }
    } catch (e) {
      show_snackbar(context, 'An unexpected error occurred. Please try again.');
    } finally {
      hideprogress(context);
    }
  }

  void login() {
    navigateToView(const LoginView(), Routes.loginView);
  }
}
