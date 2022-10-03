import 'package:clean_architecture_poc/app/core/custom_failure.dart';
import 'package:clean_architecture_poc/app/core/use_case.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/entities/appointment_entity.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/repositories/interfaces/appointments_repository_interface.dart';
import 'package:dartz/dartz.dart';

class ListAppointmentsUseCase
    implements UseCase<int?, List<AppointmentEntity>> {
  final IAppointmentsRepository repository;

  ListAppointmentsUseCase({
    required this.repository,
  });

  @override
  Future<Either<CustomFailure, List<AppointmentEntity>>> call({
    int? params,
  }) async {
    return await repository.getAll();
  }
}
