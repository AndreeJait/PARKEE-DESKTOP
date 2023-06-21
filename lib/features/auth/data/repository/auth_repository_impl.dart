import 'dart:convert';

import 'package:crypt/crypt.dart';
import 'package:parkee_app/cores/data/constant/constant.dart';
import 'package:parkee_app/cores/data/dto/dto.dart';
import 'package:parkee_app/cores/domain/domain.dart';
import 'package:parkee_app/cores/utils/util.dart';

import '../../domain/datasource/auth_datasource.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_datasource_impl.dart';

class AuthRepositoryImpl implements AuthRepository {
  late AuthDatasource authDatasource;

  AuthRepositoryImpl() {
    authDatasource = AuthDataSourceImpl();
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    var data = await authDatasource.login(request);
    await pref.setString(prefToken, data.accessToken);
    await pref.setString(prefRefreshToken, data.refreshToken);
    await pref.setInt(prefExpiredAt, data.expiredToken);
    return data;
  }

  @override
  Future<LoginResponse> refreshToken() async{
    var data = await authDatasource.refreshToken();
    await pref.setString(prefToken, data.accessToken);
    await pref.setString(prefRefreshToken, data.refreshToken);
    await pref.setInt(prefExpiredAt, data.expiredToken);
    return data;
  }
}
