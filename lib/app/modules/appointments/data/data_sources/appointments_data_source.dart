import 'package:dio/dio.dart';

import '../data.dart';

class AppointmentsDataSource implements IAppointmentsDataSource {
  final Dio client;

  AppointmentsDataSource({
    required this.client,
  });

  @override
  Future<void> create(AppointmentDTO item) async {
    await client.post(
      '/create',
      data: item.toMap(),
    );
  }

  @override
  Future<List<AppointmentDTO>> getAll() async {
    final result = await client.get(
      '/list',
    );
    return AppointmentDTO.parseToList(result.data);
  }

  @override
  Future<AppointmentDTO> getOne(int id) async {
    final result = await client.get('/$id');
    return AppointmentDTO.fromJson(result.data);
  }

  @override
  Future<void> update(AppointmentDTO item) async {
    await client.post(
      '/edit/${item.id}',
      data: item.toMap(),
    );
  }
}
