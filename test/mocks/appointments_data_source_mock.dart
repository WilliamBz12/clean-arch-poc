import 'package:clean_architecture_poc/app/modules/appointments/data/data.dart';

class AppointmentsDataSourceMock implements IAppointmentsDataSource {
  @override
  Future<void> create(AppointmentDTO item) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<List<AppointmentDTO>> getAll() async {
    return [];
  }

  @override
  Future<AppointmentDTO> getOne(int id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<void> update(AppointmentDTO item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
