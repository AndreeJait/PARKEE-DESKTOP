import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkee_app/cores/data/config/config.dart';
import 'package:parkee_app/cores/data/constant/constant.dart';
import 'package:parkee_app/cores/presentation/component/dialog/error_dialog.dart';
import 'package:parkee_app/cores/styles/styles.dart';
import 'package:parkee_app/cores/utils/util.dart';
import 'package:parkee_app/features/order/presentation/bloc/bloc.dart';
import 'package:parkee_app/features/order/presentation/component/image_picker.dart';
import 'package:parkee_app/features/order/presentation/view/check_out_view.dart';
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;

import '../../../../cores/data/dto/dto.dart';
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

  String uploadImageTwo = "";

  bool isLoading = false;

  bool loadingRequest = false;

  File? fileOne;
  File? fileTwo;

  String? pathPdf;
  var pdfData;

  int selectIndex = 0;

  OrderBloc orderBloc = OrderBloc();

  final ScreenUtil _screenUtil = ScreenUtil();

  String? selectedType;

  TextEditingController platController = TextEditingController();

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
              icon: const FaIcon(FontAwesomeIcons.carRear))
        ],
        centerTitle: false,
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
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
                orderBloc.add(ChangeOrderEvent(
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
            } else if (state.actionName == "RESPONSE_ORDER") {
              pathPdf = state.afterState.responseOrder!.linkParkingTicket;
              loadingRequest = false;
              _fetchPdfContent(pathPdf!);
              orderBloc.add(ChangeOrderEvent(
                  changed: {},
                  eventName:
                      "REFRESH_${state.afterState.uploadResponse!.url}"));
            }
          }
        },
        bloc: orderBloc,
        builder: (context, state) {
          return Padding(
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
                    if (state.vehicles.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 20),
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
                            hint: const Text("Select Vehicle Type"),
                            value: selectedType,
                            items: state.vehicles
                                .map((e) => DropdownMenuItem<String>(
                                    value: e.vehicleTypeID,
                                    child: Text(
                                        "${e.vehicleType} (${e.availableCapacity})")))
                                .toList(),
                            onChanged: (value) {
                              selectedType = value;
                              orderBloc.add(
                                ChangeOrderEvent(
                                    changed: {}, eventName: "REFRESH_${value}"),
                              );
                            },
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
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
                            loadingRequest ? "Loading..." : "Order Park",
                            style: GoogleFonts.nunito(
                              fontSize: 18,
                            ),
                          )),
                    )
                  ],
                )),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 400,
                  child: pathPdf != null
                      ? pdfData != null
                          ? PdfPreview(
                              allowPrinting: true,
                              allowSharing: false,
                              canChangePageFormat: false,
                              build: (format) => pdfData,
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            )
                      : Container(),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void handleOnClick(BuildContext context) {
    Navigator.pushReplacementNamed(context, CheckOutView.routeName);
  }

  handleOnClickUpload(int index) async {
    selectIndex = index;
    isLoading = true;
    orderBloc
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
      orderBloc.add(UploadImageEvent(
          UploadRequest(isPublic: "true", file: File(file.path))));
    } else {
      isLoading = false;
      orderBloc.add(
          ChangeOrderEvent(changed: {"test": index}, eventName: "REFRESH"));
    }
  }

  void handleOnSubmit() {
    if (platController.text.isNotEmpty &&
        uploadImageTwo.isNotEmpty &&
        uploadImageOne.isNotEmpty &&
        selectedType != null) {
      loadingRequest = true;
      pathPdf = null;
      pdfData = null;
      orderBloc.add(ChangeOrderEvent(
          changed: {"test": platController.text}, eventName: "REFRESH"));
      var req = RequestOrder(
          platController.text.toString(),
          uploadImageOne,
          uploadImageTwo,
          prefTool.getString(prefLocation, ""),
          selectedType.toString());
      orderBloc.add(RequestOrderEvent(req));
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
    selectedType = null;
    orderBloc.add(const GetVehicleInfoEvent());
    return pdfData;
  }
}
