class OrderStats {
  final num total;
  final num totalCash;
  final num totalInstaPay;
  final int unpaidOrders;
  final int orderReady;
  final int orderUnReady;
  final int numberOfOrderDelivery;
  final int numberOfRecievedFromPlace;

  OrderStats({
    required this.total,
    required this.totalCash,
    required this.totalInstaPay,
    required this.unpaidOrders,
    required this.orderReady,
    required this.orderUnReady,
    required this.numberOfOrderDelivery,
    required this.numberOfRecievedFromPlace,
  });
}
