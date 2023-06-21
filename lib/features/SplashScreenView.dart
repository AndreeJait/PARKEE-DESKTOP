import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkee_app/cores/styles/styles.dart';
import 'package:parkee_app/features/auth/presentation/view/login_view.dart';

class SplashScreenView extends StatefulWidget {
  static const String routeName = "/splash";

  SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final AppColors _appColors = AppColors();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value){
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: _appColors.primaryColor,
        ),
        width: double.infinity,
        child: Center(
          child: Text(
            tr("appName"),
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: _appColors.whiteColor,
            ),
          ),
        ),
      ),
    ));
  }
}
