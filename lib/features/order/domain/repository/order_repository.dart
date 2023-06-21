import '../../../../cores/data/dto/dto.dart';
import '../../../../cores/domain/domain.dart';

abstract class OrderRepository {
  Future<UploadResponse> upload(UploadRequest request);
  Future<List<Location>> getLocations();
  Future<List<VehicleInfo>> getVehicle();
  Future<ResponseOrder> requestOrder(RequestOrder request);
  Future<PaymentResponse> paid(RequestPayment request);
  Future<CheckoutResponse> checkout(RequestCheckOut request);
  Future<List<Voucher>> getVouchers();
}
