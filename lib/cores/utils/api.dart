part of 'util.dart';

class ApiClient {
  static late Client client;
  static late Client clientToken;
  static late Dio dio;

  static void init() {
    ApiClient.dio = Dio();
    ApiClient.dio.options.baseUrl = env.baseUrl;
    ApiClient.client = Client(dio);
  }

  static void initWithToken() {
    String token = prefTool.getString(prefToken, "");
    ApiClient.dio.options.headers["Authorization"] = "Bearer ${token}";
    ApiClient.clientToken = Client(dio);
  }
}
