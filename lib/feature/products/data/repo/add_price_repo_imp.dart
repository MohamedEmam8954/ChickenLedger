import 'package:nahlachicken/feature/products/data/datasource/local_data_source.dart';
import 'package:nahlachicken/feature/products/data/model/add_price_model.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';
import 'package:nahlachicken/feature/products/domain/repo/add_price_repo.dart';

class AddPriceRepoImp extends AddPriceRepo {
  final LocalDataSource localDataSource;

  AddPriceRepoImp({required this.localDataSource});
  @override
  Future<void> addPrice(AddPriceModel addPriceModel) async {
    await localDataSource.addPrice(addPriceModel);
  }

  @override
  List<AddPriceEntity> getPrice() {
    return localDataSource.getPrice();
  }

  @override
  addCategoryToDropDown(String category) async {
    await localDataSource.addCategoryToDropDown(category);
  }

  @override
  List<String> getCategoryFromDropDown() {
    return localDataSource.getCategoryFromDropDown();
  }

  @override
  Future<void> deleteAllPrice() async {
    await localDataSource.deleteAllPrice();
  }

  @override
  Future<void> deletePrice(String id) async {
    await localDataSource.deletePrice(id);
  }

  @override
  Future<void> updatePrice({
    required num price,
    required String id,
  }) async {
    await localDataSource.updatePrice(price: price, id: id);
  }
}
