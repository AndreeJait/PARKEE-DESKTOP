import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../styles/styles.dart';
import '../../../utils/util.dart';
import '../../bloc/bloc.dart';


class SourceFileDialog extends StatelessWidget {
  final Function()? onSelectCamera;
  final Function()? onSelectGallery;
  final AppColors _appColors = AppColors();
  final _screenUtil = ScreenUtil();

  SourceFileDialog({Key? key, this.onSelectCamera, this.onSelectGallery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = BlocProvider.of(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: _appColors.whiteColor,
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: _screenUtil.widthDefault(context),
        child: Wrap(
          spacing: 30,
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(
              width: _screenUtil.widthDefault(context) - 80,
              child: Text(
                tr("Select Image Resource"),
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            BlocBuilder<AppBloc, AppState>(builder: (context, state) {
              return SizedBox(
                width: _screenUtil.widthDefault(context) - 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed:
                            state.isLoadingUpload ? null : onSelectCamera,
                        child: state.isLoadingUpload
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                width: 50,
                                height: 50,
                                child: const Center(
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              )
                            : const FaIcon(
                                FontAwesomeIcons.camera,
                                size: 50,
                              )),
                    ElevatedButton(
                        onPressed:
                            state.isLoadingUpload ? null : onSelectGallery,
                        child: state.isLoadingUpload
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                width: 50,
                                height: 50,
                                child: const Center(
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              )
                            : const FaIcon(
                                FontAwesomeIcons.folderOpen,
                                size: 50,
                              ))
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
