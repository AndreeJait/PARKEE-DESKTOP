import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkee_app/cores/data/dto/dto.dart';
import 'package:parkee_app/cores/styles/styles.dart';
import 'package:parkee_app/cores/utils/util.dart';

import '../../../../features/order/presentation/bloc/bloc.dart';
import '../input/input_rounded.dart';

class PaymentDialog extends StatelessWidget {
  OrderBloc orderBloc;

  PaymentDialog({super.key, required this.orderBloc});

  TextEditingController originalPrice = TextEditingController();

  final ScreenUtil _screenUtil = ScreenUtil();
  final AppColors _appColors = AppColors();
  OrderBloc localBloc = OrderBloc();

  String moneyGiveBack = "";

  String? selectedVoucher;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (orderBloc.state.checkoutResponse != null) {
      originalPrice.text = "Rp.${orderBloc.state.checkoutResponse!.totalPrice}";
    }
    return BlocConsumer<OrderBloc, OrderState>(
        bloc: localBloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    width: _screenUtil.widthDefault(context) * 0.5,
                    decoration: BoxDecoration(
                        color: _appColors.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Paid Parkeer",
                          style: GoogleFonts.nunito(
                              fontSize: 26, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            "Total Price",
                            style: GoogleFonts.nunito(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: _screenUtil.widthDefault(context) * 0.5 - 40,
                          height: 50,
                          child: InputRounded(
                            enabled: false,
                            hintText: "Original price",
                            control: originalPrice,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            "Payment Method",
                            style: GoogleFonts.nunito(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: _screenUtil.widthDefault(context) * 0.5 - 40,
                          height: 50,
                          child: InputRounded(
                            enabled: false,
                            hintText: "For now just cash only",
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            "Voucher",
                            style: GoogleFonts.nunito(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        if (orderBloc.state.vouchers.isNotEmpty)
                          Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: _appColors.greySoft20),
                              borderRadius: BorderRadius.circular(10),
                              color: _appColors.whiteColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: const Text("Select Voucher Type"),
                                value: selectedVoucher,
                                items: orderBloc.state.vouchers
                                    .map((e) => DropdownMenuItem<String>(
                                        value: e.codeVoucher,
                                        child: Text(
                                            "${e.codeVoucher} (Rp.${e.value})")))
                                    .toList(),
                                onChanged: (value) {
                                  selectedVoucher = value;
                                  localBloc.add(
                                    ChangeOrderEvent(
                                        changed: {},
                                        eventName: "REFRESH_${value}"),
                                  );
                                },
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                                onPressed: !isLoading ? handleOnSubmit : () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      isLoading
                                          ? _appColors.greySoft20
                                          : _appColors.primaryColor),
                                ),
                                child: Text(
                                  isLoading ? "Loading..." : "Confirm Paid",
                                  style: GoogleFonts.nunito(
                                    fontSize: 18,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }

  handleOnSubmit() {
    isLoading = true;
    localBloc
        .add(const ChangeOrderEvent(changed: {}, eventName: "REFRESH_LOADING"));
    var req = RequestPayment(selectedVoucher != null ? [selectedVoucher!] : [],
        orderBloc.state.checkoutResponse!.codePayment, "cash");
    orderBloc.add(PaidEvent(req));
  }
}
