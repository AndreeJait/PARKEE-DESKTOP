import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'cores/data/config/config.dart';
import 'cores/presentation/bloc/bloc.dart';
import 'cores/styles/styles.dart';
import 'cores/utils/util.dart';
import 'features/SplashScreenView.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.photos.request();
  await Permission.camera.request();

  await EasyLocalization.ensureInitialized();

  // Global config can access here
  var configSource = await rootBundle.loadString("config.json");
  var jsonConfig = jsonDecode(configSource);
  Config.env = Env.fromJson(jsonConfig);

  await UtilGlobal.init();

  Style.init();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale("id", ""),
      ],
      fallbackLocale: const Locale("id"),
      path: "assets/lang",
      child: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => AppBloc())],
          child: const App())));
}


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    UtilGlobal.setContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TA_21",
      routes: route,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      initialRoute: SplashScreenView.routeName,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        primaryColor: color.primaryColor,
      ),
    );
  }
}