import 'package:get_it/get_it.dart';
import 'package:nahlachicken/feature/delivery/data/datasource/delivery_data_source.dart';
import 'package:nahlachicken/feature/delivery/data/repo/delivery_repo_imp.dart';
import 'package:nahlachicken/feature/orders/presentation/data/dataSource/add_order_local_data.dart';
import 'package:nahlachicken/feature/orders/presentation/data/repo/add_order_repo_imp.dart';
import 'package:nahlachicken/feature/postingaccounts/data/dataSource/client_amount_data_source.dart';
import 'package:nahlachicken/feature/postingaccounts/data/dataSource/client_payments_data_source.dart';
import 'package:nahlachicken/feature/postingaccounts/data/repo/client_amount_repo_imp.dart';
import 'package:nahlachicken/feature/postingaccounts/data/repo/client_payments_repo_imp.dart';

import 'package:nahlachicken/feature/products/data/datasource/local_data_source.dart';
import 'package:nahlachicken/feature/products/data/repo/add_price_repo_imp.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AddPriceRepoImp>(
    AddPriceRepoImp(localDataSource: LocalDataSourceImp()),
  );

  getIt.registerSingleton<AddOrderRepoImp>(
      AddOrderRepoImp(addOrderLocalData: AddOrderLocalDataImp()));

  getIt.registerSingleton<DeliveryRepoImp>(
      DeliveryRepoImp(deliveryDataSource: DeliveryDataSourceImp()));

  getIt.registerSingleton<ClientAmountRepoImp>(ClientAmountRepoImp(
      clientAmountDataSource: ClientAccountDataSourceImp()));

  getIt.registerSingleton<ClientPaymentsRepoImp>(ClientPaymentsRepoImp(
      clientPaymentsDataSource: ClientPaymentsDataSourceImp()));
}
