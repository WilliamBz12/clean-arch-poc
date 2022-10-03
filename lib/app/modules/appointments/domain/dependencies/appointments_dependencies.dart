import 'package:clean_architecture_poc/app/core/use_case.dart';
import 'package:clean_architecture_poc/app/modules/appointments/data/data.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/repositories/appointments_repository.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/repositories/interfaces/appointments_repository_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../use-cases/use_cases.dart';

final apiClient = Provider((ref) => Dio());

final _dataSource = Provider<IAppointmentsDataSource>(
  (ref) => AppointmentsDataSource(client: ref.read(apiClient)),
);

final _repository = Provider<IAppointmentsRepository>(
  (ref) => AppointmentsRepository(
    dataSource: ref.read(_dataSource),
  ),
);

final listAppointmentsUseCase = Provider<ListAppointmentsUseCase>(
  (ref) => ListAppointmentsUseCase(
    repository: ref.read(_repository),
  ),
);

final createAppointmentUseCase = Provider<CreateAppointmentUseCase>(
  (ref) => CreateAppointmentUseCase(
    repository: ref.read(_repository),
  ),
);
