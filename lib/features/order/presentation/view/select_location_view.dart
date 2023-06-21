import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.primaryColor,
      body: BlocBuilder<OrderBloc, OrderState>(
        bloc: orderBloc,
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 20,
              children: [
                ...state.locations
                    .map((e) => InkWell(
                          onTap: () => handleClick(e, context),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _appColors.whiteColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Text(e.name),
                          ),
                        ))
                    .toList()
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    orderBloc.add(const GetLocationsEvent());
    super.initState();
  }

  void handleClick(Location e, BuildContext context) async {
    await pref.setString(prefLocation, e.id);
    setState(() {
      Navigator.pushReplacementNamed(context, CheckInView.routeName);
    });
  }
}
