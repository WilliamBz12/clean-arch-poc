import 'package:clean_architecture_poc/app/core/custom_failure.dart';
import 'package:clean_architecture_poc/app/core/use_case.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/entities/appointment_entity.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/repositories/utils/status.dart';
import 'package:dartz/dartz.dart';

import '../repositories/interfaces/appointments_repository_interface.dart';

class CreateAppointmentUseCase
    implements UseCase<AppointmentEntity, StatusRequest> {
  final IAppointmentsRepository repository;

  CreateAppointmentUseCase({
    required this.repository,
  });

  @override
  Future<Either<CustomFailure, StatusRequest>> call({
    required AppointmentEntity params,
  }) async {
    if (params.title.isEmpty) {
      return Left(CustomFailure(message: "Titulo não pode ser vazio"));
    }

    return await repository.create(params);
  }
}
