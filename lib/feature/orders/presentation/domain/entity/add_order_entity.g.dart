// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddOrderEntityAdapter extends TypeAdapter<AddOrderEntity> {
  @override
  final int typeId = 1;

  @override
  AddOrderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddOrderEntity(
      phoneNumber: fields[16] as String,
      isPaid: fields[15] as String,
      isReady: fields[14] as String,
      quantity: fields[13] as String,
      isDelivery: fields[0] as bool,
      isOnSale: fields[1] as bool,
      orderId: fields[2] as String,
      isFreeDelivery: fields[3] as bool,
      category: fields[12] as String,
      type: fields[4] as String,
      productId: fields[5] as String,
      cleaningPrice: fields[6] as num,
      priceWithDiscount: fields[7] as num,
      priceWithoutDiscount: fields[8] as num,
      numberOfKilo: fields[9] as num,
      totalPrice: fields[10] as num,
      dateTime: fields[11] as DateTime,
      deliveryDriving: fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddOrderEntity obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.isDelivery)
      ..writeByte(1)
      ..write(obj.isOnSale)
      ..writeByte(2)
      ..write(obj.orderId)
      ..writeByte(3)
      ..write(obj.isFreeDelivery)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.productId)
      ..writeByte(6)
      ..write(obj.cleaningPrice)
      ..writeByte(7)
      ..write(obj.priceWithDiscount)
      ..writeByte(8)
      ..write(obj.priceWithoutDiscount)
      ..writeByte(9)
      ..write(obj.numberOfKilo)
      ..writeByte(10)
      ..write(obj.totalPrice)
      ..writeByte(11)
      ..write(obj.dateTime)
      ..writeByte(12)
      ..write(obj.category)
      ..writeByte(13)
      ..write(obj.quantity)
      ..writeByte(14)
      ..write(obj.isReady)
      ..writeByte(15)
      ..write(obj.isPaid)
      ..writeByte(16)
      ..write(obj.phoneNumber)
      ..writeByte(17)
      ..write(obj.deliveryDriving);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddOrderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
