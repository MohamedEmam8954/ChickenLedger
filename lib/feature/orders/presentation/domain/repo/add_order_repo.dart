import 'package:nahlachicken/feature/orders/presentation/data/models/order_model.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';

abstract class AddOrderRepo {
  Future<void> addOrder(
      {required String orderId, required OrderModel orderModel});
  List<List<AddOrderEntity>> getOrder();
  Future<void> deleteOrder(String orderId);
  Future<void> deleteProduct(String orderId, String productId);
  Future<void> deleteAllOrders();
  Future<void> updateOrderStatus(
      {required String orderId, String? orderPaid, String? orderReady});
}
