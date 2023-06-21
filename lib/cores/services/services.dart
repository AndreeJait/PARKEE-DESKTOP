import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'services.g.dart';

@RestApi()
abstract class Client {
  factory Client(Dio dio) = _Client;
}
