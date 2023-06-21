import 'dart:io';
import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:parkee_app/features/auth/presentation/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../features/SplashScreenView.dart';

part 'screen.dart';

part 'logger.dart';

part 'routes.dart';

part 'preferences.dart';

part 'json.dart';


class UtilGlobal {
  static late LogUtils log;
  static late BuildContext context;
  static late PreferencesUtils preferences;
  static late FirebaseApp app;

  static Future<void> init() async {
    UtilGlobal.log = LogUtils();
    SharedPreferences pref = await SharedPreferences.getInstance();
    preferences = PreferencesUtils(pref);
  }

  static void setContext(BuildContext context) {
    UtilGlobal.context = context;
  }
}

var log = UtilGlobal.log;
var pref = UtilGlobal.preferences.sharedPreferences;
var prefTool = UtilGlobal.preferences;
var appDb = UtilGlobal.app;
