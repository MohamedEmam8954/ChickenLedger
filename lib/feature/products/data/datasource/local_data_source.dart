import 'package:hive_flutter/hive_flutter.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/products/data/model/add_price_model.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';

abstract class LocalDataSource {
  Future<void> addPrice(AddPriceModel addPriceModel);
  List<AddPriceEntity> getPrice();
  addCategoryToDropDown(String category);
  List<String> getCategoryFromDropDown();
  Future<void> deletePrice(String id);
  Future<void> deleteAllPrice();
  Future<void> updatePrice({required num price, required String id});
}

class LocalDataSourceImp extends LocalDataSource {
  Box<AddPriceEntity> get box => Hive.box<AddPriceEntity>(kaddPrice);
  Box<String> get categoryBox => Hive.box<String>(kaddCategory);
  @override
  Future<void> addPrice(AddPriceModel addPriceModel) async {
    await box.put(addPriceModel.productId, addPriceModel);
  }

  @override
  List<AddPriceEntity> getPrice() {
    return box.values.toList();
  }

  @override
  addCategoryToDropDown(String category) async {
    await categoryBox.add(category);
  }

  @override
  List<String> getCategoryFromDropDown() {
    return categoryBox.values.toList();
  }

  @override
  Future<void> deleteAllPrice() async {
    await box.clear();
  }

  @override
  Future<void> deletePrice(String id) async {
    await box.delete(id);
  }

  @override
  Future<void> updatePrice({
    required num price,
    required String id,
  }) async {
    final AddPriceEntity getoldItem = box.get(id)!;

    final AddPriceModel addNewPrice = AddPriceModel(
        type: getoldItem.type,
        priceWithOutDiscount: price,
        category: getoldItem.category,
        productId: getoldItem.productId,
        numberOfKilo: getoldItem.numberOfKilo,
        priceWithDiscount: getoldItem.priceWithDiscount,
        isOnSale: getoldItem.isOnSale);

    await box.put(id, addNewPrice);
  }
}
