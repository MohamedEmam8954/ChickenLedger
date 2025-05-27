import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';

class OrderModel extends AddOrderEntity {
  OrderModel({
    required super.phoneNumber,
    required super.isPaid,
    required super.isReady,
    required super.quantity,
    required super.isDelivery,
    required super.isOnSale,
    required super.orderId,
    required super.isFreeDelivery,
    required super.category,
    required super.type,
    required super.productId,
    required super.cleaningPrice,
    required super.priceWithDiscount,
    required super.priceWithoutDiscount,
    required super.numberOfKilo,
    required super.totalPrice,
    required super.dateTime,
    required super.deliveryDriving,
  });
}
