import 'package:nahlachicken/feature/products/data/model/add_price_model.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';

abstract class AddPriceRepo {
  Future<void> addPrice(AddPriceModel addPriceModel);
  List<AddPriceEntity> getPrice();
  Future<void> addCategoryToDropDown(String category);
  List<String> getCategoryFromDropDown();
  Future<void> deletePrice(String id);
  Future<void> deleteAllPrice();
  Future<void> updatePrice({required num price, required String id});
}
