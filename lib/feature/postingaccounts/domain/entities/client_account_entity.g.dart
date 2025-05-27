// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_account_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientAccountEntityAdapter extends TypeAdapter<ClientAccountEntity> {
  @override
  final int typeId = 4;

  @override
  ClientAccountEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClientAccountEntity(
      name: fields[0] as String,
      phoneNumber: fields[1] as String?,
      totalPrice: fields[2] as num,
      addAmount: fields[3] as num?,
      postAmount: fields[4] as num?,
      clientId: fields[5] as String,
      dateTime: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ClientAccountEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.totalPrice)
      ..writeByte(3)
      ..write(obj.addAmount)
      ..writeByte(4)
      ..write(obj.postAmount)
      ..writeByte(5)
      ..write(obj.clientId)
      ..writeByte(6)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientAccountEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
