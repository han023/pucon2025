import 'package:flutter/cupertino.dart';
import 'package:pucon2025/services/auth_service.dart';
import 'package:pucon2025/services/database/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../common/constants/helper_functions.dart';

class ForgetpassViewModel extends BaseViewModel {
  final _auth = locator<AuthService>();
  final _user = locator<UserService>();
  final _navigation = locator<NavigationService>();
  TextEditingController email = TextEditingController();

  Future<void> forgetpassword(BuildContext context) async {
    if (email.text.isEmpty) {
      show_snackbar(context, "Fill Email");
    } else {
      displayprogress(context);

      bool exits = await _user.findUser(email.text);
      hideprogress(context);

      if (!exits) {
        show_snackbar(context, "No User Found");
        return;
      }

      await _auth.sendPasswordResetLink(email.text);

      show_snackbar(context, "Forget Password Mail has been send");
    }
  }

  void login(BuildContext context) async {
    _navigation.back();
  }

  void back() {
    _navigation.back();
  }
}
