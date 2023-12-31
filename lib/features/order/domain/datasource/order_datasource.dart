
import 'package:parkee_app/cores/data/dto/dto.dart';

import '../../../../cores/domain/domain.dart';

abstract class OrderDatasource {
  Future<UploadResponse> upload(UploadRequest request);
  Future<List<Location>> getLocations();
  Future<List<VehicleInfo>> getVehicleInfo();
  Future<ResponseOrder> requestOrder(RequestOrder request);
  Future<PaymentResponse> paid(RequestPayment request);
  Future<CheckoutResponse> checkout(RequestCheckOut request);
  Future<List<Voucher>> getVouchers();
}
