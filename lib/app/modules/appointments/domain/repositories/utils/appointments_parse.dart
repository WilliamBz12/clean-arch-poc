import '../../../data/dto/appointment_dto.dart';
import '../../entities/appointment_entity.dart';

class AppointmentsParse {
  static AppointmentEntity fromDTOToEntity(
    AppointmentDTO data,
  ) =>
      AppointmentEntity(
        title: data.title,
        id: data.id!,
      );

  static List<AppointmentEntity> fromListDtoToListEntity(
    List<AppointmentDTO> data,
  ) =>
      data.map((e) => AppointmentEntity(id: e.id!, title: e.title)).toList();

  static AppointmentDTO fromEntityToDTO(AppointmentEntity e) =>
      AppointmentDTO(id: e.id, title: e.title);
}
