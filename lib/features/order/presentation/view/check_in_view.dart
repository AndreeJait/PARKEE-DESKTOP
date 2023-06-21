import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkee_app/cores/styles/styles.dart';
import 'package:parkee_app/features/order/presentation/bloc/bloc.dart';
import 'package:parkee_app/features/order/presentation/component/image_picker.dart';
import 'package:parkee_app/features/order/presentation/view/check_out_view.dart';
import 'package:parkee_app/main.dart';

import '../../../../cores/presentation/component/input/input_rounded.dart';

class CheckInView extends StatefulWidget {
  static const String routeName = "/order/checkin";

  CheckInView({super.key});

  @override
  State<CheckInView> createState() => _CheckInViewState();
}

class _CheckInViewState extends State<CheckInView> {
  final AppColors _appColors = AppColors();

  String uploadImageOne = "";

  String uploadImageTwo =  "";

  int selectIndex = 0;

  OrderBloc orderBloc = OrderBloc();

  @override
  void initState() {
    orderBloc.add(const GetVehicleInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.whiteColor,
      appBar: AppBar(
        title: Text("Check In"),
        actions: [
          IconButton(
              onPressed: () => handleOnClick(context),
              icon: FaIcon(FontAwesomeIcons.carRear))
        ],
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: ImagePicker(
                        onTap: ()=> handleOnClickUpload(0),
                      ),
                    )),
                    Expanded(child: ImagePicker(
                      onTap: ()=> handleOnClickUpload(1),
                    ))
                  ],
                ),
                InputRounded(
                  margin: EdgeInsets.only(top: 30),
                  hintText: "Vehicle Number",
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 50,
                  width: 200,
                  child: ElevatedButton(onPressed: handleOnSubmit, child: Text("Submit")),
                )
              ],
            )),
            Container(
              width: 400,
            )
          ],
        ),
      ),
    );
  }

  void handleOnClick(BuildContext context) {
    Navigator.pushReplacementNamed(context, CheckOutView.routeName);
  }

  handleOnClickUpload(int index) {
    selectIndex = index;

  }

  void handleOnSubmit() {
  }
}
