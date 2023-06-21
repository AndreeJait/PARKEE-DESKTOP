import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkee_app/cores/presentation/component/dialog/payment_dialog.dart';
import 'package:parkee_app/cores/styles/styles.dart';
import 'package:parkee_app/cores/utils/util.dart';
import 'package:parkee_app/features/order/presentation/bloc/bloc.dart';
import 'package:parkee_app/features/order/presentation/view/check_in_view.dart';
import 'package:printing/printing.dart';

import '../../../../cores/data/config/config.dart';
import '../../../../cores/data/dto/dto.dart';
import '../../../../cores/presentation/component/dialog/error_dialog.dart';
import '../../../../cores/presentation/component/input/input_rounded.dart';
import '../component/image_picker.dart';
import 'package:http/http.dart' as http;

class CheckOutView extends StatelessWidget {
  static const String routeName = "/order/checkout";

  CheckOutView({super.key});

  final AppColors _appColors = AppColors();
  final ScreenUtil _screenUtil = ScreenUtil();

  final OrderBloc _orderBloc = OrderBloc();

  File? fileOne;
  File? fileTwo;

  String uploadImageOne = "";
  String uploadImageTwo = "";

  TextStyle textStyleLabel =
      GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16);
  TextStyle textStyleValue =
      GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 16);

  String? pathPdf;
  var pdfData;

  int selectIndex = 0;

  TextEditingController platController = TextEditingController();

  bool isLoading = false;
  bool loadingRequest = false;

  @override
  Widget build(BuildContext context) {
    _orderBloc.add(const GetAllVoucher());
    return Scaffold(
      backgroundColor: _appColors.whiteColor,
      appBar: AppBar(
        title: const Text("Check Out"),
        actions: [
          IconButton(
              onPressed: () => handleOnClick(context),
              icon: const FaIcon(FontAwesomeIcons.carOn))
        ],
        centerTitle: false,
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
        bloc: _orderBloc,
        listener: (context, state) {
          if (state is ChangedOrderState) {
            if (state.actionName == "UPLOADED_DATA") {
              isLoading = false;
              if (state.afterState.uploadResponse != null) {
                if (selectIndex == 0) {
                  uploadImageOne = state.afterState.uploadResponse!.url;
                } else if (selectIndex == 1) {
                  uploadImageTwo = state.afterState.uploadResponse!.url;
                }
                _orderBloc.add(ChangeOrderEvent(
                    changed: {},
                    eventName:
                        "REFRESH_${state.afterState.uploadResponse!.url}"));
              }
            } else if (state.actionName == "ERROR_EVENT") {
              isLoading = false;
              loadingRequest = false;
              showDialog(
                  context: context,
                  builder: (context) => Center(
                        child: ErrorDialog(
                            message: state.afterState.error!.message.toString(),
                            title:
                                "Error with code ${state.afterState.error!.code}"),
                      ));
            } else if (state.actionName == "RESPONSE_CHECKOUT") {
              isLoading = false;
              loadingRequest = false;
              uploadImageTwo = "";
              uploadImageOne = "";
              fileTwo = null;
              fileOne = null;
              pdfData = null;
              pathPdf = null;
              platController.clear();
              _orderBloc.add(
                  const ChangeOrderEvent(changed: {}, eventName: "REFRESH"));
            } else if (state.actionName == "RESPONSE_PAYMENT") {
              Navigator.pop(context);
              _fetchPdfContent(state.afterState.paymentResponse!.structPaid);
            }
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
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
                          child: Column(
                            children: [
                              ImagePicker(
                                isLoading: selectIndex == 0 && isLoading,
                                file: fileOne,
                                onTap: () => handleOnClickUpload(0),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: const Text("Car Image"),
                              )
                            ],
                          ),
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            ImagePicker(
                              isLoading: selectIndex == 1 && isLoading,
                              file: fileTwo,
                              onTap: () => handleOnClickUpload(1),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text("Driver Image"),
                            )
                          ],
                        ))
                      ],
                    ),
                    InputRounded(
                      control: platController,
                      margin: EdgeInsets.only(top: 30),
                      hintText: "Vehicle Number",
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: !loadingRequest ? handleOnSubmit : () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                loadingRequest
                                    ? _appColors.greySoft20
                                    : _appColors.primaryColor),
                          ),
                          child: Text(
                            loadingRequest ? "Loading..." : "Check Out",
                            style: GoogleFonts.nunito(
                              fontSize: 18,
                            ),
                          )),
                    )
                  ],
                )),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 400,
                  child: pdfData != null
                      ? SizedBox(
                          width: 400,
                          child: PdfPreview(
                            allowPrinting: true,
                            allowSharing: false,
                            canChangePageFormat: false,
                            build: (format) => pdfData,
                          ),
                        )
                      : Column(
                          children: [
                            if (state.checkoutResponse != null &&
                                pdfData == null)
                              Container(
                                decoration: BoxDecoration(
                                    color: _appColors.whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: _appColors.greySoft20,
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                      )
                                    ]),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Code Payment",
                                          style: textStyleLabel,
                                        ),
                                        Text(
                                          state.checkoutResponse!.codePayment,
                                          style: textStyleValue,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Price",
                                          style: textStyleLabel,
                                        ),
                                        Text(
                                          state.checkoutResponse!.totalPrice
                                              .toString(),
                                          style: textStyleValue,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Time",
                                          style: textStyleLabel,
                                        ),
                                        Expanded(
                                            child: Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            state.checkoutResponse!.totalDif,
                                            style: textStyleValue.copyWith(
                                                fontSize: 14),
                                            textAlign: TextAlign.end,
                                          ),
                                        ))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Date Entry",
                                          style: textStyleLabel,
                                        ),
                                        Text(
                                          state.checkoutResponse!.entryTime,
                                          style: textStyleValue,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Exit Time",
                                          style: textStyleLabel,
                                        ),
                                        Text(
                                          state.checkoutResponse!.exitTime,
                                          style: textStyleValue,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Vehicle Type",
                                          style: textStyleLabel,
                                        ),
                                        Text(
                                          state.checkoutResponse!.vehicleType,
                                          style: textStyleValue,
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 100,
                                      height: 50,
                                      margin: EdgeInsets.only(top: 20),
                                      child: ElevatedButton(
                                        onPressed: () => handleOnPaid(context),
                                        child: Text("Paid"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void handleOnSubmit() {
    if (platController.text.isNotEmpty &&
        uploadImageTwo.isNotEmpty &&
        uploadImageOne.isNotEmpty) {
      loadingRequest = true;
      pathPdf = null;
      pdfData = null;
      _orderBloc.add(ChangeOrderEvent(
          changed: {"test": platController.text}, eventName: "REFRESH"));
      var request = RequestCheckOut(
          platController.text.toString(), uploadImageOne, uploadImageTwo);
      _orderBloc.add(CheckoutRequestEvent(request));
    }
  }

  void handleOnClick(BuildContext context) {
    Navigator.pushReplacementNamed(context, CheckInView.routeName);
  }

  handleOnClickUpload(int index) async {
    selectIndex = index;
    isLoading = true;
    _orderBloc
        .add(ChangeOrderEvent(changed: {"test": index}, eventName: "REFRESH"));
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'images',
      extensions: <String>['jpg', 'png'],
    );
    final XFile? file =
        await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
    if (file != null) {
      if (index == 0) {
        fileOne = File(file.path);
      } else if (index == 1) {
        fileTwo = File(file.path);
      }
      _orderBloc.add(UploadImageEvent(
          UploadRequest(isPublic: "true", file: File(file.path))));
    } else {
      isLoading = false;
      _orderBloc.add(ChangeOrderEvent(
          changed: {"test": "RESET"}, eventName: "REFRESH_${index}"));
    }
  }

  Future<Uint8List> _fetchPdfContent(final String url) async {
    log.info("${env.baseUrl}/upload$url");
    http.Response response =
        await http.get(Uri.parse("${env.baseUrl}/upload$url"));
    pdfData = response.bodyBytes;
    await Printing.layoutPdf(onLayout: (format) async => pdfData);
    uploadImageOne = "";
    uploadImageTwo = "";
    fileOne = null;
    fileTwo = null;
    platController.clear();
    _orderBloc.add(const ChangeOrderEvent(
        changed: {"test": "RESET"}, eventName: "REFRESH_SHOW_PDF"));
    return pdfData;
  }

  handleOnPaid(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return PaymentDialog(
            orderBloc: _orderBloc,
          );
        });
  }
}
