import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pucon2025/services/fcmnoification_service.dart';
import 'package:pucon2025/services/localstorage_service.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../model/UserModel.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/cloudinary_service.dart';
import '../../../../services/database/user_service.dart';
import '../../../common/constants/helper_functions.dart';
import '../login/login_view.dart';

class SignupViewModel extends BaseViewModel {
  final _auth = locator<AuthService>();
  final _user = locator<UserService>();
  final _fcm = locator<FcmnoificationService>();
  final _cloudinary = locator<CloudinaryService>();
  final _localstorage = locator<LocalstorageService>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = MaskedTextController(mask: '0000-0000000');

  bool verify = false;
  bool obsure = true;

  File? image;

  String cat = "doctor";
  List<String> categories = ["doctor", "user"];

  void toggle() {
    obsure = !obsure;
    notifyListeners();
  }

  void updateCat(String val) {
    cat = val;
    notifyListeners();
  }

  Future<void> profilepic() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> signup(BuildContext context) async {
    final emailText = email.text.trim();
    final passwordText = password.text;
    final nameText = name.text.trim();
    final numberText = number.text.trim();

    if (emailText.isEmpty ||
        passwordText.isEmpty ||
        nameText.isEmpty ||
        numberText.isEmpty ||
        cat == "") {
      show_snackbar(context, "Fill All Fields");
      return;
    }

    displayprogress(context);
    try {
      UserCredential userCredential =
          await _auth.register(emailText, passwordText);

      await userCredential.user!.sendEmailVerification();

      final token = await _fcm.fcmToken();
      final imgUrl = await _cloudinary.uploadFileToCloudinary(image);

      final data = UserModel(
        id: '',
        uid: userCredential.user!.uid,
        email: emailText,
        cat: cat,
        notificationId: token ?? '',
        name: nameText,
        number: numberText,
        img: imgUrl,
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
