import '../../../../cores/data/dto/dto.dart';
import '../../../../cores/domain/domain.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest request);
  Future<LoginResponse> refreshToken();
}
