import 'package:clean_architecture_poc/app/modules/appointments/presentation/dependencies/appointments_dependencies.dart';
import 'package:clean_architecture_poc/app/modules/appointments/presentation/view/components/list_appointments_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListAppointmentsPage extends ConsumerStatefulWidget {
  const ListAppointmentsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListAppointmentsPageState();
}

class _ListAppointmentsPageState extends ConsumerState<ListAppointmentsPage> {
  @override
  void initState() {
    ref.read(listAppointmentsStateProvider.notifier).load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listState = ref.watch(listAppointmentsStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: listState.maybeWhen(
        loadFailure: Text.new,
        loadInProgress: CircularProgressIndicator.new,
        loadSuccess: ListAppointmentsComponent.new,
        orElse: Container.new,
      ),
    );
  }
}
