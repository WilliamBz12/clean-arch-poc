import '../../../../core/custom_failure.dart';
import '../../data/data_sources/interfaces/appointments_data_source_interface.dart';
import '../entities/appointment_entity.dart';
import 'interfaces/appointments_repository_interface.dart';
import 'utils/appointments_parse.dart';
import 'utils/status.dart';
import 'package:dartz/dartz.dart';

class AppointmentsRepository implements IAppointmentsRepository {
  final IAppointmentsDataSource dataSource;
  AppointmentsRepository({required this.dataSource});

  @override
  Future<Either<CustomFailure, StatusRequest>> create(
    AppointmentEntity item,
  ) async {
    try {
      final dto = AppointmentsParse.fromEntityToDTO(item);
      await dataSource.create(dto);
      return const Right(StatusRequest.created);
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CustomFailure, List<AppointmentEntity>>> getAll() async {
    try {
      final result = await dataSource.getAll();
      final items = AppointmentsParse.fromListDtoToListEntity(result);
      return Right(items);
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CustomFailure, AppointmentEntity>> getOne(int id) async {
    try {
      final result = await dataSource.getOne(id);
      final entity = AppointmentsParse.fromDTOToEntity(result);
      return Right(entity);
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CustomFailure, StatusRequest>> update(
    AppointmentEntity item,
  ) async {
    try {
      final dto = AppointmentsParse.fromEntityToDTO(item);
      await dataSource.update(dto);
      return const Right(StatusRequest.updated);
    } catch (e) {
      return Left(
        CustomFailure(message: e.toString()),
      );
    }
  }
}
