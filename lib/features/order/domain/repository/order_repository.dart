import '../../../../cores/data/dto/dto.dart';
import '../../../../cores/domain/domain.dart';

abstract class OrderRepository {
  Future<UploadResponse> upload(UploadRequest request);
  Future<List<Location>> getLocations();
  Future<List<VehicleInfo>> getVehicle();
}
