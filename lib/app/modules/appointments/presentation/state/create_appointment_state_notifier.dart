import 'package:clean_architecture_poc/app/core/common_state/common_state.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/entities/appointment_entity.dart';
import 'package:clean_architecture_poc/app/modules/appointments/domain/use-cases/create_appointment_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef CreateAppointmentState = CommonState<String, String>;

class CreateAppointmentStateNotifier
    extends StateNotifier<CreateAppointmentState> {
  CreateAppointmentStateNotifier({
    required this.useCase,
  }) : super(const CreateAppointmentState.initial());

  final CreateAppointmentUseCase useCase;

  void load(AppointmentEntity data) async {
    state = const CreateAppointmentState.loadInProgress();
    final result = await useCase.call(params: data);
    result.fold(
      (l) => state = CreateAppointmentState.loadFailure(l.message),
      (r) => state = const CreateAppointmentState.loadSuccess('success'),
    );
  }
}
