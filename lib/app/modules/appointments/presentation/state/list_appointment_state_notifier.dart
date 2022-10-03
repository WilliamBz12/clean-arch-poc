import '../../../../core/common_state/common_state.dart';
import '../../domain/entities/appointment_entity.dart';
import '../../domain/use-cases/list_apppointments_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ListAppointmentState = CommonState<String, List<AppointmentEntity>>;

class ListAppointmentStateNotifier extends StateNotifier<ListAppointmentState> {
  ListAppointmentStateNotifier({
    required this.useCase,
  }) : super(const ListAppointmentState.initial());

  final ListAppointmentsUseCase useCase;

  void load() async {
    state = const ListAppointmentState.loadInProgress();
    final result = await useCase.call();
    result.fold(
      (l) => state = ListAppointmentState.loadFailure(l.message),
      (data) => state = ListAppointmentState.loadSuccess(data),
    );
  }
}
