import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkee_app/cores/styles/styles.dart';

class InputRounded extends StatelessWidget {
  List<TextInputFormatter> inputFormatter;

  InputRounded(
      {super.key,
      this.control,
      this.margin,
      this.inputFormatter = const [],
      this.enabled = true,
      this.errorText,
      this.obscureText = false,
      this.hintText = "Input here",
      this.width = double.infinity,
      this.height = 50});

  double width;
  bool enabled;
  double height;

  EdgeInsets? margin;

  AppColors _appColors = AppColors();
  TextEditingController? control;
  String hintText;
  bool obscureText;

  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: errorText == null
                        ? _appColors.greySoft20
                        : _appColors.redColor)),
            child: TextField(
              obscureText: obscureText,
              enabled: enabled,
              controller: control,
              inputFormatters: inputFormatter,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          if (errorText != null)
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(errorText!),
            )
        ],
      ),
    );
  }
}
