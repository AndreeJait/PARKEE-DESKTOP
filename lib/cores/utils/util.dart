import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:parkee_app/cores/data/config/config.dart';
import 'package:parkee_app/cores/data/constant/constant.dart';
import 'package:parkee_app/cores/services/services.dart';
import 'package:parkee_app/features/auth/presentation/view/login_view.dart';
import 'package:parkee_app/features/order/presentation/view/check_in_view.dart';
import 'package:parkee_app/features/order/presentation/view/check_out_view.dart';
import 'package:parkee_app/features/order/presentation/view/select_location_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/SplashScreenView.dart';

part 'screen.dart';

part 'logger.dart';

part 'routes.dart';

part 'preferences.dart';

part 'json.dart';

part 'api.dart';

class UtilGlobal {
  static late LogUtils log;
  static late BuildContext context;
  static late PreferencesUtils preferences;

  static Future<void> init() async {
    UtilGlobal.log = LogUtils();
    SharedPreferences pref = await SharedPreferences.getInstance();
    preferences = PreferencesUtils(pref);
    ApiClient.init();
  }

  static void setContext(BuildContext context) {
    UtilGlobal.context = context;
  }
}

var log = UtilGlobal.log;
var pref = UtilGlobal.preferences.sharedPreferences;
var prefTool = UtilGlobal.preferences;
var client = ApiClient.client;
var clientToken = ApiClient.clientToken;
