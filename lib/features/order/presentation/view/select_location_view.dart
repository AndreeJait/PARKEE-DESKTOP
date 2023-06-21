import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkee_app/cores/data/constant/constant.dart';
import 'package:parkee_app/cores/domain/domain.dart';
import 'package:parkee_app/cores/styles/styles.dart';
import 'package:parkee_app/cores/utils/util.dart';
import 'package:parkee_app/features/order/presentation/bloc/bloc.dart';
import 'package:parkee_app/features/order/presentation/view/check_in_view.dart';

class SelectLocationView extends StatefulWidget {
  static const String routeName = "/order/select-location";

  const SelectLocationView({super.key});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  final AppColors _appColors = AppColors();

  OrderBloc orderBloc = OrderBloc();

  final ScreenUtil _screenUtil = ScreenUtil();
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.primaryColor,
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "Select Parking Area",
              style: GoogleFonts.nunito(
                  fontSize: 25, color: _appColors.whiteColor),
            ),
            BlocBuilder<OrderBloc, OrderState>(
              bloc: orderBloc,
              builder: (context, state) {
                if (state.locations.isNotEmpty) {
                  return Container(
                    margin: EdgeInsets.only(top: 20),
                    width: _screenUtil.widthDefault(context) * 0.5,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _appColors.whiteColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text("Select location"),
                        value: selectedLocation,
                        items: state.locations
                            .map((e) => DropdownMenuItem<String>(
                                value: e.id, child: Text(e.name)))
                            .toList(),
                        onChanged: (value) {
                          selectedLocation = value;
                          orderBloc.add(
                            ChangeOrderEvent(
                                changed: {}, eventName: "REFRESH_${value}"),
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () => handleClick(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_appColors.whiteColor),
                ),
                child: Text("Select", style: TextStyle(
                  color: _appColors.blackSoft
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    orderBloc.add(const GetLocationsEvent());
    super.initState();
  }

  void handleClick(BuildContext context) async {
    if (selectedLocation != null) {
      await pref.setString(prefLocation, selectedLocation!);
      setState(() {
        Navigator.pushReplacementNamed(context, CheckInView.routeName);
      });
    }
  }
}
