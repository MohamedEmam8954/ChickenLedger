import 'package:go_router/go_router.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/add_delivery_view.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/delivery_filter_view.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/delivery_orders.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/delivery_orders_filter.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/show_delivery_order_view.dart';
import 'package:nahlachicken/feature/fingerprint/presentation/views/finger_print_view.dart';
import 'package:nahlachicken/feature/navigation/presentation/views/navigation.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/add_order.dart';
import 'package:nahlachicken/feature/orders/presentation/views/balance_wallet_view.dart';
import 'package:nahlachicken/feature/orders/presentation/views/filter_view.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/add_client_view.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/client_payments_view.dart';
import 'package:nahlachicken/feature/products/presentation/manager/cubit/add_price_cubit.dart';
import 'package:nahlachicken/feature/products/presentation/views/add_price.dart';
import 'package:nahlachicken/feature/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String fingerPrint = "/fingerprint";
  static const String navigation = "/navigationView";
  static const String addPrice = "/addPrice";
  static const String addOrder = "/addorder";
  static const String balanceWallet = "/balanceWallet";
  static const String filterView = "/FilterView";
  static const String deliveryOrderFilterView = "/DeliveryOrderFilterView";
  static const String addeliveryView = "/adddeliveryView";
  static const String deliveryOrdersView = "/deliveryOrdersView";
  static const String showDeliveryOrder = "/showDeliveryOrder";
  static const String deliveryFilterView = "/DeliveryFilterOrder";
  static const String addClientView = "/addClientView";

  static const String clientPaymentView = "/clientPaymentView";

  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: fingerPrint,
      builder: (context, state) => FingerPrintView(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => SplashView(),
    ),
    GoRoute(
      path: navigation,
      builder: (context, state) => Navigation(),
    ),
    GoRoute(
      path: addPrice,
      builder: (context, state) => AddPrices(
        addPriceCubit: state.extra as AddPriceCubit,
      ),
    ),
    GoRoute(
        path: addOrder,
        builder: (context, state) {
          return AddOrder(
            addOrderCubit: state.extra as AddOrderCubit,
          );
        }),
    GoRoute(
      path: balanceWallet,
      builder: (context, state) => BalenceWalletView(
        addOrderCubit: state.extra as AddOrderCubit,
      ),
    ),
    GoRoute(
      path: filterView,
      builder: (context, state) => FilterView(
        addOrderCubit: state.extra as AddOrderCubit,
      ),
    ),
    GoRoute(
      path: addeliveryView,
      builder: (context, state) =>
          AddDeliveryView(deliveryCubit: state.extra as DeliveryCubit),
    ),
    GoRoute(
        path: deliveryOrdersView,
        builder: (context, state) {
          Map<String, dynamic> extra = state.extra as Map<String, dynamic>;

          return DeliveryOrdersView(
            deliveryName: extra["deliveryName"] as String,
            deliveryId: extra["DeliveryId"] as String,
            deliveryCubit: extra["deliveryCubit"] as DeliveryCubit,
            deliveryOrderCubit:
                extra["deliveryOrderCubit"] as DeliveryOrderCubit,
          );
        }),
    GoRoute(
        path: deliveryOrderFilterView,
        builder: (context, state) => DeliveryOrdersFilterView(
              deliveryOrderCubit: state.extra as DeliveryOrderCubit,
            )),
    GoRoute(
      path: showDeliveryOrder,
      builder: (context, state) {
        Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        return ShowDeliveryOrderView(
          deliveryEntity: extra["deliveryEntity"] as DeliveryEntity,
          deliveryCubit: extra["deliveryCubit"] as DeliveryCubit,
        );
      },
    ),
    GoRoute(
      path: deliveryFilterView,
      builder: (context, state) => DeliveryFilterView(
        deliveryCubit: state.extra as DeliveryCubit,
      ),
    ),
    GoRoute(
      path: addClientView,
      builder: (context, state) => AddClientView(
        clientAmountCubit: state.extra as ClientAmountCubit,
      ),
    ),
    GoRoute(
        path: clientPaymentView,
        builder: (context, state) {
          var extra = state.extra as Map<String, dynamic>;

          return ClientPaymentsView(
              clientId: extra["clientId"] as String,
              clientAmountCubit:
                  extra["clientAmountCubit"] as ClientAmountCubit);
        }),
  ]);
}
