
import 'package:parkee_app/cores/data/dto/dto.dart';

import '../../../../cores/domain/domain.dart';

abstract class AuthDatasource {
  Future<LoginResponse> login(LoginRequest request);
  Future<LoginResponse> refreshToken();
}
