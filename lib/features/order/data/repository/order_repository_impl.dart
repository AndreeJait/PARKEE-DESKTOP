import 'dart:convert';

import 'package:crypt/crypt.dart';
import 'package:parkee_app/cores/data/constant/constant.dart';
import 'package:parkee_app/cores/data/dto/dto.dart';
import 'package:parkee_app/cores/domain/domain.dart';
import 'package:parkee_app/cores/utils/util.dart';
import 'package:parkee_app/features/order/domain/datasource/order_datasource.dart';

import '../../domain/repository/order_repository.dart';
import '../datasource/order_datasource_impl.dart';



class OrderRepositoryImpl implements OrderRepository {
  late OrderDatasource orderDatasource;

  OrderRepositoryImpl() {
    orderDatasource = OrderDataSourceImpl();
  }

  @override
  Future<UploadResponse> upload(UploadRequest request) async {
    var data = await orderDatasource.upload(request);
    return data;
  }

  @override
  Future<List<Location>> getLocations() {
    return orderDatasource.getLocations();
  }

  @override
  Future<List<VehicleInfo>> getVehicle() {
    return orderDatasource.getVehicleInfo();
  }
}
