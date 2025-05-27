// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_delivery_order_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssignedDeliveyOrderEntityAdapter
    extends TypeAdapter<AssignedDeliveyOrderEntity> {
  @override
  final int typeId = 3;

  @override
  AssignedDeliveyOrderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssignedDeliveyOrderEntity(
      orderId: fields[0] as String,
      productsNumber: fields[1] as int,
      phoneNumber: fields[2] as String,
      totalOrder: fields[3] as num,
      orderStatus: fields[4] as String,
      orderUnready: fields[5] as String,
      orderDate: fields[6] as String,
      deliveryDriving: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AssignedDeliveyOrderEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.orderId)
      ..writeByte(1)
      ..write(obj.productsNumber)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.totalOrder)
      ..writeByte(4)
      ..write(obj.orderStatus)
      ..writeByte(5)
      ..write(obj.orderUnready)
      ..writeByte(6)
      ..write(obj.orderDate)
      ..writeByte(7)
      ..write(obj.deliveryDriving);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignedDeliveyOrderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
