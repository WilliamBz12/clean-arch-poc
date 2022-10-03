import 'package:clean_architecture_poc/app/modules/appointments/domain/entities/appointment_entity.dart';
import 'package:clean_architecture_poc/app/modules/appointments/presentation/view/widgets/item_appointment_widget.dart';
import 'package:flutter/material.dart';

class ListAppointmentsComponent extends StatelessWidget {
  const ListAppointmentsComponent(
    this.data, {
    Key? key,
  }) : super(key: key);
  final List<AppointmentEntity> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ItemAppointmentWidget(
        item: data[index],
      ),
      itemCount: data.length,
    );
  }
}
