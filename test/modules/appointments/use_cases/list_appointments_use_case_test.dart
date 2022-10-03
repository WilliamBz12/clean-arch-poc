import 'package:clean_architecture_poc/app/modules/appointments/data/data.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/repositories/appointments_repository.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/repositories/interfaces/appointments_repository_interface.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/use-cases/list_apppointments_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/appointments_data_source_mock.dart';

void main() {
  late IAppointmentsDataSource appointmentsDataSource;
  late ListAppointmentsUseCase listAppointmentsUseCase;
  late IAppointmentsRepository appointmentsRepository;

  setUp(
    () {
      appointmentsDataSource = AppointmentsDataSourceMock();
      appointmentsRepository =
          AppointmentsRepository(dataSource: appointmentsDataSource);
      listAppointmentsUseCase =
          ListAppointmentsUseCase(repository: appointmentsRepository);
    },
  );

  test(
    "should return a list with data when try get succefull",
    () async {
      final result = await listAppointmentsUseCase.call();
      expect(result.isRight(), equals(true));
      expect(result.getOrElse(() => []).length, equals(0));
    },
  );
}
