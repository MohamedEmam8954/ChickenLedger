import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/dependency_injection.dart';
import 'package:nahlachicken/feature/delivery/data/repo/delivery_repo_imp.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/delivery_view.dart';
import 'package:nahlachicken/feature/navigation/presentation/views/widgets/litsview_nav.dart';
import 'package:nahlachicken/feature/orders/presentation/data/repo/add_order_repo_imp.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/orderSatus/cubit/order_status_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/searchandfilter/cubit/search_and_filter_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/order_view.dart';
import 'package:nahlachicken/feature/postingaccounts/data/repo/client_amount_repo_imp.dart';
import 'package:nahlachicken/feature/postingaccounts/data/repo/client_payments_repo_imp.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/client_amount_view.dart';
import 'package:nahlachicken/feature/products/data/repo/add_price_repo_imp.dart';
import 'package:nahlachicken/feature/products/presentation/manager/cubit/add_price_cubit.dart';
import 'package:nahlachicken/feature/products/presentation/views/price_view.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  var box = Hive.box<String>(kFilterOrderType);

  late final List<Widget> list;

  @override
  void initState() {
    super.initState();

    list = [
      BlocProvider(
        create: (context) =>
            AddPriceCubit(getIt.get<AddPriceRepoImp>())..getPrice(),
        child: PriceView(),
      ),
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            String orderType = Hive.box<String>(kFilterOrderType)
                    .get(kFilterOrderType, defaultValue: 'all') ??
                'all';

            return AddOrderCubit(getIt.get<AddOrderRepoImp>())
              ..filterOrder(filterType: orderType);
          }),
          BlocProvider(
            create: (context) =>
                SearchAndFilterCubit(getIt.get<AddOrderRepoImp>()),
          ),
          BlocProvider(
            create: (context) => OrderStatusCubit(getIt.get<AddOrderRepoImp>()),
          ),
        ],
        child: OrderView(),
      ),
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            String deliveryFilter = Hive.box<String>(kFilterDeliveryType)
                    .get("filterDeliveryType", defaultValue: 'unPaid') ??
                'unPaid';

            return DeliveryCubit(getIt.get<DeliveryRepoImp>())
              ..getDelivery(deliveryFilter);
          }),
          BlocProvider(create: (context) {
            var box = Hive.box<String>(kFilterDeliveryOrderType);
            var deliveryFilter =
                box.get("DeliveryOrder", defaultValue: "all") ?? "all";
            return DeliveryOrderCubit(getIt.get<AddOrderRepoImp>())
              ..sendFilter(deliveryFilter);
          }),
        ],
        child: const DeliveryView(),
      ),
      BlocProvider(
        create: (context) => ClientAmountCubit(
            clientAmountRepo: getIt.get<ClientAmountRepoImp>(),
            clientPaymentsRepo: getIt.get<ClientPaymentsRepoImp>())
          ..getAllClientAmount(),
        child: const ClientAmoutView(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: list,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            color: kSecondaryColor,
            child: SizedBox(
              height: 45,
              child: ListviewNav(
                onchanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
