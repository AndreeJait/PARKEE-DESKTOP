import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkee_app/cores/data/dto/dto.dart';
import 'package:parkee_app/cores/presentation/component/input/input_rounded.dart';
import 'package:parkee_app/cores/styles/styles.dart';
import 'package:parkee_app/features/auth/presentation/bloc/bloc.dart';
import 'package:parkee_app/features/order/presentation/view/check_in_view.dart';
import 'package:parkee_app/features/order/presentation/view/select_location_view.dart';

class LoginView extends StatelessWidget {
  static const String routeName = "/login";

  LoginView({super.key});

  final AppColors _appColors = AppColors();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  AuthBloc authBloc = AuthBloc();

  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    passwordController.addListener(() {
      errorMessage = null;
      authBloc.add(ChangeAuthEvent(changed: {}, eventName: "REFRESH_${passwordController.text.toString()}"));
    });
    emailController.addListener(() {
      errorMessage = null;
      authBloc.add(ChangeAuthEvent(changed: {}, eventName: "REFRESH_${passwordController.text.toString()}"));
    });
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ChangedAuthState) {
          if (state.actionName == "LOGIN_EVENT") {
            isLoading = false;
            Navigator.pushReplacementNamed(context, SelectLocationView.routeName);
          } else if (state.actionName == "ERROR_EVENT") {
            isLoading = false;
            errorMessage = state.afterState.error!.message;
          }
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          body: Container(
            decoration: BoxDecoration(color: _appColors.primaryColor),
            child: Center(
              child: Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    width: 500,
                    decoration: BoxDecoration(
                        color: _appColors.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            tr("appName"),
                            style: const TextStyle(
                              fontSize: 26,
                            ),
                          ),
                        ),
                        InputRounded(
                          errorText: errorMessage,
                          control: emailController,
                          margin: const EdgeInsets.only(bottom: 20),
                          hintText: "Email Guard Parking",
                        ),
                        InputRounded(
                          errorText: errorMessage,
                          control: passwordController,
                          hintText: "Password",
                          obscureText: true,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    !isLoading
                                        ? _appColors.primaryColor
                                        : _appColors.greySoft20),
                              ),
                              onPressed:
                                  !isLoading ? handleOnPressLogin : () {},
                              child: Text(!isLoading ? "Login" : "Loading")),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
      bloc: authBloc,
    );
  }

  void handleOnPressLogin() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isLoading = true;
      errorMessage = null;
      authBloc.add(const ChangeAuthEvent(changed: {}, eventName: "REFRESH"));
      authBloc.add(LoginEvent(
          request: LoginRequest(
        password: passwordController.text,
        email: emailController.text,
      )));
    }
  }
}
