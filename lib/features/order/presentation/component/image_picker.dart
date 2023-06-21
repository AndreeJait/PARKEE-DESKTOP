import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkee_app/cores/styles/styles.dart';

class ImagePicker extends StatelessWidget {
  ImagePicker({super.key, this.file, this.onTap});

  File? file;

  Function()? onTap;

  final AppColors _appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 450,
        decoration: BoxDecoration(
          color: _appColors.greySoft20,
        ),
        child: file != null
            ? FittedBox(
          child: Image.file(file!),
        )
            : const Center(
          child: FaIcon(
            FontAwesomeIcons.image,
            size: 100,
          ),
        ),
      ),
    );
  }
}
