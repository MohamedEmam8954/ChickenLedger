import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';

class AddPriceModel extends AddPriceEntity {
  AddPriceModel({
    required super.type,
    required super.priceWithOutDiscount,
    required super.category,
    required super.productId,
    required super.numberOfKilo,
    required super.priceWithDiscount,
    required super.isOnSale,
  });

  AddPriceModel copyWith(num? price) {
    return AddPriceModel(
        type: type,
        priceWithOutDiscount: price ?? priceWithOutDiscount,
        category: category,
        productId: productId,
        numberOfKilo: numberOfKilo,
        priceWithDiscount: priceWithDiscount,
        isOnSale: isOnSale);
  }
}
