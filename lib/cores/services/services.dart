import 'package:dio/dio.dart';
import 'package:parkee_app/cores/data/constant/constant.dart';
import 'package:parkee_app/cores/data/dto/dto.dart';
import 'package:retrofit/http.dart';

import '../domain/domain.dart';

part 'services.g.dart';

@RestApi()
abstract class Client {
  factory Client(Dio dio) = _Client;

  @POST(endPointLogin)
  Future<BaseResponse> login(@Body() LoginRequest request);

  @POST(endPointRefreshToken)
  Future<BaseResponse> refreshToken();


}
