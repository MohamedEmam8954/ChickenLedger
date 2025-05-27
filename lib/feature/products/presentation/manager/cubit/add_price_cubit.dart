import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/feature/products/data/model/add_price_model.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';
import 'package:nahlachicken/feature/products/domain/repo/add_price_repo.dart';
import 'package:uuid/uuid.dart';
part 'add_price_state.dart';

class AddPriceCubit extends Cubit<AddPriceState> {
  AddPriceCubit(this.addPriceRepo) : super(AddPriceInitial());
  final AddPriceRepo addPriceRepo;

  List<AddPriceEntity> getPriceList = [];

  addPrice(
      {required String type,
      required num price,
      required String category,
      required bool isOnSale,
      required String numberOfKilo,
      required num priceWithDiscount}) async {
    emit(AddPriceloading());
    var uuid = const Uuid();
    try {
      AddPriceModel addPriceModel = AddPriceModel(
          isOnSale: isOnSale,
          numberOfKilo: numberOfKilo,
          priceWithDiscount: priceWithDiscount,
          type: type,
          priceWithOutDiscount: price,
          category: category,
          productId: uuid.v4());
      await addPriceRepo.addPrice(addPriceModel);
      emit(AddPriceSucess());
    } catch (e) {
      emit(AddPriceFailure("حدث خطا اثناء اضافه السعر حاول مره اخرى"));
    }
  }

  getPrice() {
    emit(GetPriceloading());
    var data = addPriceRepo.getPrice();
    if (data.isNotEmpty) {
      getPriceList = data;
      emit(GetPriceSucess(data));
    } else {
      emit(GetPriceFailure());
    }
  }

  List<AddPriceEntity> getProductDependOnCategory({required String category}) {
    var data = addPriceRepo.getPrice();
    List<AddPriceEntity> products = [];
    products = data
        .where((item) => item.category == category && !item.isOnSale)
        .toList();
    return products;
  }

  List<AddPriceEntity> getOnSaleProducts() {
    var data = addPriceRepo.getPrice();
    List<AddPriceEntity> products = [];
    products = data.where((item) => item.isOnSale == true).toList();
    return products;
  }

  deleteAllPrice() async {
    emit(DeleteAllPriceLoading());
    try {
      await addPriceRepo.deleteAllPrice();
      emit(DeleteAllPriceSucess());
    } catch (e) {
      emit(DeletePriceFailure("حدث خطا اثناء حذف السعر حاول مره اخرى"));
    }
  }

  deleteProduct({required String id}) async {
    await addPriceRepo.deletePrice(id);
    getPrice();
  }

  Future<void> updatePrice(
      {required num price,
      required String id,
      required String category}) async {
    await addPriceRepo.updatePrice(price: price, id: id);
    getPrice();
  }
}
