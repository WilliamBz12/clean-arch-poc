import 'package:clean_architecture_poc/app/modules/appointments/data/dto/appointment_dto.dart';

abstract class IAppointmentsDataSource {
  Future<List<AppointmentDTO>> getAll();
  Future<AppointmentDTO> getOne(int id);
  Future<void> create(AppointmentDTO item);
  Future<void> update(AppointmentDTO item);
}
