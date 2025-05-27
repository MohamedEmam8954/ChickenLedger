import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/helper/my_bloc_observer.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/core/utils/dependency_injection.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_account_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_payments_entity.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setup();
  Hive.registerAdapter(AddPriceEntityAdapter());
  Hive.registerAdapter(AddOrderEntityAdapter());
  Hive.registerAdapter(DeliveryEntityAdapter());
  Hive.registerAdapter(AssignedDeliveyOrderEntityAdapter());
  Hive.registerAdapter(ClientAccountEntityAdapter());
  Hive.registerAdapter(ClientPaymentsEntityAdapter());

  if (!Hive.isBoxOpen(kaddPrice)) {
    await Hive.openBox<AddPriceEntity>(kaddPrice);
  }
  if (!Hive.isBoxOpen(kaddOrder)) {
    await Hive.openBox<List>(kaddOrder);
  }
  await Hive.openBox<String>(kaddCategory);
  await Hive.openBox<String>(kFilterOrderType);
  await Hive.openBox<String>(kFilterDeliveryOrderType);
  await Hive.openBox<String>(kFilterDeliveryType);
  await Hive.openBox<DeliveryEntity>(kaddDelivery);
  await Hive.openBox<AssignedDeliveyOrderEntity>(kAssignOrderToDelivery);
  await Hive.openBox<ClientAccountEntity>(kAssignClientAccount);
  await Hive.openBox<ClientPaymentsEntity>(kClientPayments);

  Bloc.observer = MyBlocObserver();

  runApp(NahlaChicken());
}

class NahlaChicken extends StatelessWidget {
  const NahlaChicken({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color(0xff111211)),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
