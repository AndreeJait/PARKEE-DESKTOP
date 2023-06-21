import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkee_app/features/order/presentation/view/check_in_view.dart';

class CheckOutView extends StatelessWidget {
  static const String routeName = "/order/checkout";
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check OUT"),
        actions: [
          IconButton(
              onPressed: () => handleOnClick(context),
              icon: FaIcon(FontAwesomeIcons.carOn))
        ],
        centerTitle: false,
      ),
    );
  }

  void handleOnClick(BuildContext context) {
    Navigator.pushReplacementNamed(context, CheckInView.routeName);
  }
}
