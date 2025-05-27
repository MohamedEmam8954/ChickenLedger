import 'package:nahlachicken/feature/orders/presentation/data/models/order_status.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';

OrderStats calculateOrderStats(List<List<AddOrderEntity>> list) {
  num total = 0;
  num totalCash = 0;
  num totalInstaPay = 0;
  int unpaidOrders = 0;
  int orderReady = 0;
  int orderUnReady = 0;
  int numberOfOrderDelivery = 0;
  int numberOfRecievedFromPlace = 0;

  for (var order in list) {
    if (order.isEmpty) continue;

    for (var item in order) {
      total += item.totalPrice;
      if (item.isPaid == "cash") {
        totalCash += item.totalPrice;
      } else if (item.isPaid == "instaPay") {
        totalInstaPay += item.totalPrice;
      }
    }

    var first = order.first;

    if (first.isPaid == "unpaid") unpaidOrders++;
    if (first.isReady == "ready") orderReady++;
    if (first.isReady == "unReady") orderUnReady++;
    if (first.isDelivery) {
      numberOfOrderDelivery++;
    } else {
      numberOfRecievedFromPlace++;
    }
  }

  return OrderStats(
    total: total,
    totalCash: totalCash,
    totalInstaPay: totalInstaPay,
    unpaidOrders: unpaidOrders,
    orderReady: orderReady,
    orderUnReady: orderUnReady,
    numberOfOrderDelivery: numberOfOrderDelivery,
    numberOfRecievedFromPlace: numberOfRecievedFromPlace,
  );
}
