// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntityProfileAdapter extends TypeAdapter<EntityProfile> {
  @override
  final int typeId = 1;

  @override
  EntityProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EntityProfile(
      id: fields[0] as String,
      uuid: fields[1] as String,
      email: fields[2] as String,
      fullname: fields[3] as String,
      username: fields[4] as String?,
      isVerifiedAccount: fields[5] as bool?,
      linkedWithGoogle: fields[6] as bool?,
      googleEmail: fields[7] as String?,
      passportNo: fields[8] as String?,
      residentNo: fields[9] as String?,
      phone: fields[10] as String?,
      photo: fields[11] as String?,
      userType: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EntityProfile obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.fullname)
      ..writeByte(4)
      ..write(obj.username)
      ..writeByte(5)
      ..write(obj.isVerifiedAccount)
      ..writeByte(6)
      ..write(obj.linkedWithGoogle)
      ..writeByte(7)
      ..write(obj.googleEmail)
      ..writeByte(8)
      ..write(obj.passportNo)
      ..writeByte(9)
      ..write(obj.residentNo)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.photo)
      ..writeByte(12)
      ..write(obj.userType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
