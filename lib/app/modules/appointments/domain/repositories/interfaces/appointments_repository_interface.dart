import 'package:clean_architecture_poc/app/modules/appointments/domain/entities/appointment_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/custom_failure.dart';
import '../utils/status.dart';

abstract class IAppointmentsRepository {
  Future<Either<CustomFailure, List<AppointmentEntity>>> getAll();
  Future<Either<CustomFailure, AppointmentEntity>> getOne(int id);
  Future<Either<CustomFailure, StatusRequest>> create(AppointmentEntity item);
  Future<Either<CustomFailure, StatusRequest>> update(AppointmentEntity item);
}
