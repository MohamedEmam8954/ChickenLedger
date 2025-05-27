import 'package:flutter/material.dart';
import 'package:nahlachicken/core/utils/assets.dart';

const String kPoppinsFont = 'Poppins';
const String kaddPrice = 'kaddPrice';
const String kaddOrder = 'kaddOrder';
const String kaddCategory = 'kaddCategory';
const String kFilterOrderType = 'kFilterType';
const String kFilterDeliveryOrderType = 'kFilterDeliveryType';
const String kFilterDeliveryType = 'kFilterDelivery';
const String kaddDelivery = 'kAddDelivery';
const String kAssignOrderToDelivery = 'kAssignOrderToDelivery';
const String kAssignClientAccount = 'kAssignClientAccount';
const String kClientPayments = 'kClientPayments';

const Color kPrimaryColor = Color(0xff111211);
const Color kSecondaryColor = Color(0xff18181a);
const Color kAccentColorLight = Color(0xfff15527);
const Color kAccentColorDark = Color(0xfff15527);
Color kgrayColor = Colors.grey[600]!;

List<String> categories = [
  "فراخ",
  "بط",
  "قطع فراخ",
  "مجمدات",
  "مقبلات",
  "اخري",
];

Map<String, List<String>> type = {
  categories[0]: ["فراخ عتاقي", "فراخ بيضاء", "حمام كداب", "فراخ شوي"],
  categories[1]: ["بط بلدي", "بط مولر"],
  categories[2]: ["اوراك", "دبابيس", "كبد وقوانص", "اجنحه"],
  categories[3]: ["بانيه", "شيش طاووق", "استربس", "برجر", "كوردن بلو", "كبيبة"],
  categories[4]: ["سمبوسه جبنه", "سمبوسه لحم"],
  categories[5]: [],
};

Map<String, String> productsImage = {
  "فراخ عتاقي": Assets.imagesRedChicken,
  "فراخ بيضاء": Assets.imagesChicken,
  "حمام كداب": Assets.imagesChickenliar,
  "فراخ شوي": Assets.imagesGrilledChicken,
  "بط بلدي": Assets.imagesDuck,
  "بط مولر": Assets.imagesDuck,
  "اوراك": Assets.imagesThigh,
  "دبابيس": Assets.imagesPins,
  "كبد وقوانص": Assets.imagesLiver,
  "اجنحه": Assets.imagesWings,
  "بانيه": Assets.imagesBreast,
  "شيش طاووق": Assets.imagesShish,
  "استربس": Assets.imagesSterbs,
  "برجر": Assets.imagesBurger,
  "كوردن بلو": Assets.imagesCordonbleu,
  "كبيبة": Assets.imagesKubeba,
  "سمبوسه جبنه": Assets.imagesSambosa,
  "سمبوسه لحم": Assets.imagesSambosa,
};
