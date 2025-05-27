// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeliveryEntityAdapter extends TypeAdapter<DeliveryEntity> {
  @override
  final int typeId = 2;

  @override
  DeliveryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeliveryEntity(
      deliveryid: fields[0] as String,
      name: fields[1] as String,
      phoneNumber: fields[2] as String?,
      deliveryDriving: fields[8] as String,
      totalPrice: fields[3] as num,
      orderNumber: fields[4] as int,
      deliveryStatus: fields[5] as String,
      deliveryTime: fields[6] as DateTime?,
      orders: (fields[7] as List).cast<AssignedDeliveyOrderEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, DeliveryEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.deliveryid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.totalPrice)
      ..writeByte(4)
      ..write(obj.orderNumber)
      ..writeByte(5)
      ..write(obj.deliveryStatus)
      ..writeByte(6)
      ..write(obj.deliveryTime)
      ..writeByte(7)
      ..write(obj.orders)
      ..writeByte(8)
      ..write(obj.deliveryDriving);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeliveryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
