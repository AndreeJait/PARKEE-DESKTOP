import 'dart:ui';

part 'colors.dart';

class Style{
  static late AppColors colors;

  static void init(){
    Style.colors = AppColors();
  }
}

var color = Style.colors;
