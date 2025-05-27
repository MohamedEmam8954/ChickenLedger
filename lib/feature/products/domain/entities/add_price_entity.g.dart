// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_price_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddPriceEntityAdapter extends TypeAdapter<AddPriceEntity> {
  @override
  final int typeId = 0;

  @override
  AddPriceEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddPriceEntity(
      type: fields[0] as String,
      priceWithOutDiscount: fields[1] as num,
      category: fields[2] as String,
      productId: fields[3] as String,
      numberOfKilo: fields[4] as String,
      priceWithDiscount: fields[5] as num,
      isOnSale: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AddPriceEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.priceWithOutDiscount)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.productId)
      ..writeByte(4)
      ..write(obj.numberOfKilo)
      ..writeByte(5)
      ..write(obj.priceWithDiscount)
      ..writeByte(6)
      ..write(obj.isOnSale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddPriceEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
