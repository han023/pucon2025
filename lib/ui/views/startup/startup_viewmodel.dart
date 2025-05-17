import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:pucon2025/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/localstorage_service.dart';
import '../auth/login/login_view.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedpref = locator<LocalstorageService>();

  Future runStartupLogic() async {
    _sharedpref.initialize();
    await Future.delayed(const Duration(seconds: 3));
    if (_sharedpref.readString(auth) == "true") {
      _navigationService.clearStackAndShow(Routes.homeView);
      _navigationService.replaceWithTransition(const HomeView(),
          routeName: Routes.homeView,
          transitionStyle: Transition.rightToLeft);
    } else {
      _navigationService.replaceWithTransition(const LoginView(),
          routeName: Routes.loginView, transitionStyle: Transition.rightToLeft);
    }
  }
}
