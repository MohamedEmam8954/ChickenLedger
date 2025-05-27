// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_payments_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientPaymentsEntityAdapter extends TypeAdapter<ClientPaymentsEntity> {
  @override
  final int typeId = 5;

  @override
  ClientPaymentsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClientPaymentsEntity(
      clientId: fields[0] as String,
      name: fields[1] as String,
      phoneNumber: fields[2] as String?,
      totalPrice: fields[3] as num,
      dateTime: fields[4] as DateTime,
      isadded: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ClientPaymentsEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.clientId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.totalPrice)
      ..writeByte(4)
      ..write(obj.dateTime)
      ..writeByte(5)
      ..write(obj.isadded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientPaymentsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
