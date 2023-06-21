part of 'util.dart';

Map<String, Widget Function(BuildContext)> route = {
  SplashScreenView.routeName: (context) => SplashScreenView(),
  LoginView.routeName: (context) => LoginView(),
};
