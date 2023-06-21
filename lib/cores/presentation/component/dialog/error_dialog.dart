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
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: color.whiteColor, borderRadius: BorderRadius.circular(10)),
        constraints: const BoxConstraints(
          maxWidth: 500,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Wrap(
          children: [
            Center(
              child: Text(
                title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: color.redColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                message,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  color: color.blackSoft,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
