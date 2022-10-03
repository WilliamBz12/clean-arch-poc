import 'package:clean_architecture_poc/app/modules/appointments/domain/entities/appointment_entity.dart';
import 'package:flutter/material.dart';

class ItemAppointmentWidget extends StatelessWidget {
  const ItemAppointmentWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final AppointmentEntity item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
    );
  }
}
