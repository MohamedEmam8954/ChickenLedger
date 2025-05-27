import 'package:nahlachicken/feature/orders/presentation/data/dataSource/add_order_local_data.dart';
import 'package:nahlachicken/feature/orders/presentation/data/models/order_model.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/repo/add_order_repo.dart';

class AddOrderRepoImp extends AddOrderRepo {
  final AddOrderLocalData addOrderLocalData;

  AddOrderRepoImp({required this.addOrderLocalData});
  @override
  Future<void> addOrder(
      {required String orderId, required OrderModel orderModel}) {
    return addOrderLocalData.addOrder(orderId: orderId, orderModel: orderModel);
  }

  @override
  List<List<AddOrderEntity>> getOrder() {
    return addOrderLocalData.getOrder();
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    await addOrderLocalData.deleteOrder(orderId);
  }

  @override
  Future<void> deleteProduct(String orderId, String productId) async {
    await addOrderLocalData.deleteProduct(orderId, productId);
  }

  @override
  Future<void> deleteAllOrders() async {
    await addOrderLocalData.deleteAllOrders();
  }

  @override
  Future<void> updateOrderStatus(
      {required String orderId, String? orderPaid, String? orderReady}) async {
    return await addOrderLocalData.updateOrderStatus(
        orderId: orderId, orderPaid: orderPaid, orderReady: orderReady);
  }
}
