part of 'util.dart';

Map<String, Widget Function(BuildContext)> route = {
  SplashScreenView.routeName: (context) => SplashScreenView(),
  LoginView.routeName: (context) => LoginView(),
  CheckInView.routeName: (context) => CheckInView(),
  CheckOutView.routeName: (context) => CheckOutView(),
  SelectLocationView.routeName: (context)=> SelectLocationView()
};
