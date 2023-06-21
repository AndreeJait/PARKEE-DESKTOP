import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:parkee_app/cores/data/config/config.dart';
import 'package:parkee_app/cores/data/dto/dto.dart';
import 'package:parkee_app/cores/domain/domain.dart';
import 'package:parkee_app/cores/utils/exception.dart';
import 'package:parkee_app/cores/utils/util.dart';

import '../../../../cores/data/constant/constant.dart';
import '../../domain/datasource/auth_datasource.dart';
import 'package:http/http.dart' as http;

class AuthDataSourceImpl implements AuthDatasource {
  AuthDataSourceImpl();

  @override
  Future<LoginResponse> login(LoginRequest req) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse('${env.baseUrl}/auth/authentication'));
      request.body = json.encode(req.toJson());
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        BaseResponse baseResponse = BaseResponse.fromJson(temp);
        LoginResponse loginResponse =
            LoginResponse.fromJson(baseResponse.response.body);
        return loginResponse;
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
  Future<LoginResponse> refreshToken() async{
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefTool.getString(prefRefreshToken, "")}'
      };
      var request = http.Request('POST', Uri.parse('${env.baseUrl}/api/v1/auth/refresh-token'));
      request.body = json.encode({});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var strRes = await response.stream.bytesToString();
        Map<String, dynamic> temp = json.decode(strRes);
        BaseResponse baseResponse = BaseResponse.fromJson(temp);
        LoginResponse loginResponse =
        LoginResponse.fromJson(baseResponse.response.body);
        return loginResponse;
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
