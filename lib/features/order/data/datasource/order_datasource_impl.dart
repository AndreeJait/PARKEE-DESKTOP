import 'dart:convert';

import 'package:parkee_app/cores/data/config/config.dart';
import 'package:parkee_app/cores/data/constant/constant.dart';
import 'package:parkee_app/cores/data/dto/dto.dart';
import 'package:parkee_app/cores/domain/domain.dart';
import 'package:parkee_app/cores/utils/exception.dart';
import 'package:parkee_app/cores/utils/util.dart';

import 'package:http/http.dart' as http;

import '../../domain/datasource/order_datasource.dart';

class OrderDataSourceImpl implements OrderDatasource {
  OrderDataSourceImpl();

  @override
  Future<UploadResponse> upload(UploadRequest req) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${prefTool.getString(prefToken, "")}'
      };
      var request =
          http.MultipartRequest('POST', Uri.parse('${env.baseUrl}/upload'));
      request.fields.addAll({
        'is_public': req.isPublic,
      });
      request.files
          .add(await http.MultipartFile.fromPath('file', req.file.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        BaseResponse baseResponse = BaseResponse.fromJson(temp);
        UploadResponse res =
            UploadResponse.fromJson(baseResponse.response.body);
        return res;
      } else {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        ErrorResponse baseResponse = ErrorResponse.fromJson(temp);
        throw ExceptionError(
            message: baseResponse.error.message ?? "",
            code: baseResponse.error.codeError);
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<Location>> getLocations() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${prefTool.getString(prefToken, "")}'
      };
      var request =
          http.Request('GET', Uri.parse('${env.baseUrl}/location/all'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        BaseResponse baseResponse = BaseResponse.fromJson(temp);
        List<Location> locations = [];
        baseResponse.response.body.forEach((it) {
          locations.add(Location.fromJson(it));
        });
        return locations;
      } else {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        ErrorResponse baseResponse = ErrorResponse.fromJson(temp);
        throw ExceptionError(
            message: baseResponse.error.message ?? "",
            code: baseResponse.error.codeError);
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<VehicleInfo>> getVehicleInfo() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${prefTool.getString(prefToken, "")}'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${env.baseUrl}/location/${prefTool.getString(prefLocation, "")}/capacity'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        BaseResponse baseResponse = BaseResponse.fromJson(temp);
        List<VehicleInfo> locations = [];
        baseResponse.response.body["info"].forEach((it) {
          locations.add(VehicleInfo.fromJson(it));
        });
        return locations;
      } else {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        ErrorResponse baseResponse = ErrorResponse.fromJson(temp);
        throw ExceptionError(
            message: baseResponse.error.message ?? "",
            code: baseResponse.error.codeError);
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<ResponseOrder> requestOrder(RequestOrder req) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefTool.getString(prefToken, "")}'
      };
      var request =
          http.Request('POST', Uri.parse('${env.baseUrl}/order/request'));
      request.body = json.encode(req.toJson());
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        BaseResponse baseResponse = BaseResponse.fromJson(temp);
        var res = ResponseOrder.fromJson(baseResponse.response.body);
        return res;
      } else {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        ErrorResponse baseResponse = ErrorResponse.fromJson(temp);
        throw ExceptionError(
            message: baseResponse.error.message ?? "",
            code: baseResponse.error.codeError);
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<CheckoutResponse> checkout(RequestCheckOut req) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefTool.getString(prefToken, "")}'
      };
      var request = http.Request(
          'POST', Uri.parse('${env.baseUrl}/order/checkout/manual'));
      request.body = json.encode(req.toJson());
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        BaseResponse baseResponse = BaseResponse.fromJson(temp);
        var res = CheckoutResponse.fromJson(baseResponse.response.body);
        return res;
      } else {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        ErrorResponse baseResponse = ErrorResponse.fromJson(temp);
        throw ExceptionError(
            message: baseResponse.error.message ?? "",
            code: baseResponse.error.codeError);
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<Voucher>> getVouchers() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${prefTool.getString(prefToken, "")}'
      };
      var request =
          http.Request('GET', Uri.parse('${env.baseUrl}/voucher'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        BaseResponse baseResponse = BaseResponse.fromJson(temp);
        List<Voucher> vouchers = [];
        baseResponse.response.body.forEach((it) {
          vouchers.add(Voucher.fromJson(it));
        });
        return vouchers;
      } else {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        ErrorResponse baseResponse = ErrorResponse.fromJson(temp);
        throw ExceptionError(
            message: baseResponse.error.message ?? "",
            code: baseResponse.error.codeError);
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<PaymentResponse> paid(RequestPayment req) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefTool.getString(prefToken, "")}'
      };
      var request = http.Request('POST', Uri.parse('${env.baseUrl}/payment'));
      request.body = json.encode(req.toJson());
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        BaseResponse baseResponse = BaseResponse.fromJson(temp);
        var res = PaymentResponse.fromJson(baseResponse.response.body);
        return res;
      } else {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        ErrorResponse baseResponse = ErrorResponse.fromJson(temp);
        throw ExceptionError(
            message: baseResponse.error.message ?? "",
            code: baseResponse.error.codeError);
      }
    } catch (err) {
      rethrow;
    }
  }
}
