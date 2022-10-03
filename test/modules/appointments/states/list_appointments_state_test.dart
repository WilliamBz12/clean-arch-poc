import 'package:clean_architecture_poc/app/modules/appointments/data/data.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/repositories/appointments_repository.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/repositories/interfaces/appointments_repository_interface.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/use-cases/use_cases.dart';
import 'package:clean_architecture_poc/app/modules/appointments/presentation/state/list_appointment_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/appointments_data_source_mock.dart';

void main() {
  late IAppointmentsDataSource appointmentsDataSource;
  late ListAppointmentsUseCase listAppointmentsUseCase;
  late IAppointmentsRepository appointmentsRepository;
  late ListAppointmentStateNotifier listAppointmentStateNotifier;

  setUp(
    () {
      appointmentsDataSource = AppointmentsDataSourceMock();
      appointmentsRepository = AppointmentsRepository(
        dataSource: appointmentsDataSource,
      );
      listAppointmentsUseCase = ListAppointmentsUseCase(
        repository: appointmentsRepository,
      );
      listAppointmentStateNotifier = ListAppointmentStateNotifier(
        useCase: listAppointmentsUseCase,
      );
    },
  );

  test(
    "should return success when try get correctly",
    () async {
      listAppointmentStateNotifier.load();

      expect(
        listAppointmentStateNotifier.debugState,
        equals(const ListAppointmentState.loadInProgress()),
      );
      await Future.microtask(() {});

      expect(
        listAppointmentStateNotifier.debugState,
        equals(const ListAppointmentState.loadSuccess([])),
      );
    },
  );
}
