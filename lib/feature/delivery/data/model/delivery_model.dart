import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';

class DeliveryModel extends DeliveryEntity {
  DeliveryModel({
    required super.deliveryid,
    required super.name,
    required super.totalPrice,
    required super.orderNumber,
    required super.deliveryStatus,
    super.deliveryTime,
    super.phoneNumber,
    required super.orders,
    required super.deliveryDriving,
  });
}
