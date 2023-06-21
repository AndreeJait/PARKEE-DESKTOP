import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkee_app/cores/styles/styles.dart';

class ImagePicker extends StatelessWidget {
  ImagePicker({super.key, this.file, this.onTap, this.isLoading = false});

  File? file;

  Function()? onTap;

  bool isLoading;
  final AppColors _appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 450,
        decoration: BoxDecoration(
          color: _appColors.greySoft20,
        ),
        child: isLoading
            ? Container(
                width: double.infinity,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(),
                    )
                  ],
                ),
              )
            : file != null
                ? Image.file(file!, fit: BoxFit.cover,)
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
