import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../styles/styles.dart';
import '../../../utils/util.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  final String title;
  final bool canTryAgain;
  final bool canClose;
  final Function()? tryAgain;

  ErrorDialog(
      {Key? key,
      required this.message,
      required this.title,
      this.canClose = false,
      this.canTryAgain = false,
      this.tryAgain})
      : super(key: key);
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.widthDefault(context),
      padding: EdgeInsets.symmetric(
          horizontal: _screenUtil.widthDefault(context) * 0.1),
      child: Wrap(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Center(
                  child: Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: color.blackSoft,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
