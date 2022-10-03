import '../../domain/dependencies/appointments_dependencies.dart';
import '../state/list_appointment_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/create_appointment_state_notifier.dart';

final listAppointmentsStateProvider =
    StateNotifierProvider<ListAppointmentStateNotifier, ListAppointmentState>(
  (ref) => ListAppointmentStateNotifier(
    useCase: ref.read(listAppointmentsUseCase),
  ),
);

final createAppointmentsStateProvider = StateNotifierProvider<
    CreateAppointmentStateNotifier, CreateAppointmentState>(
  (ref) => CreateAppointmentStateNotifier(
    useCase: ref.read(createAppointmentUseCase),
  ),
);
