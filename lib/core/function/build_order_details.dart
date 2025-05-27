import 'package:nahlachicken/core/function/time_with_12hour.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';

String buildOrderDetails(num totalPrice, AddOrderEntity addOrderEntity,
    List<AddOrderEntity> orders) {
  final buffer = StringBuffer();

  buffer.writeln("🧾🧾🧾🧾🧾🧾🧾🧾🧾");
  buffer.writeln("🐔 مجزر نهله للدواجن 🐔");
  buffer.writeln("📅 ${timeWith12Hour(addOrderEntity.dateTime)}");
  buffer.writeln("🧾 رقم الأوردر: ${addOrderEntity.orderId}");

  if (addOrderEntity.phoneNumber.isEmpty) {
    buffer.writeln("🚶‍♂️ الاستلام: من المحل");
  } else {
    buffer.writeln("📞 رقم الهاتف: ${addOrderEntity.phoneNumber}");
  }

  buffer.writeln("────────────────────────────");

  for (var item in orders) {
    buffer.writeln("📦 تفاصيل المنتج:");
    buffer.writeln("• النوع: ${item.type}");
    buffer.writeln("• الوزن: ${item.numberOfKilo} كجم");

    item.quantity.isEmpty ? "" : buffer.writeln("• الكمية: ${item.quantity}");
    buffer.writeln("• السعر ${item.priceWithoutDiscount} جنيه");

    final quantity = item.quantity.isEmpty ? 0 : num.parse(item.quantity);
    final total = item.cleaningPrice * quantity -
        item.priceWithoutDiscount * item.numberOfKilo;

    buffer.writeln("💰 تكلفة: $total جنيه");

    buffer.writeln("────────────────────────────");
  }

  buffer.writeln("🧮 الإجمالي: $totalPrice جنيه");

  buffer.writeln(
      "✅ ${addOrderEntity.isPaid != 'unpaid' ? 'تم الدفع' : 'غير مدفوع'}");
  buffer.writeln(
      "📦 ${addOrderEntity.isReady == 'ready' ? 'جاهز للاستلام' : 'قيد التحضير'}");

  buffer.writeln("────────────────────────────");

  buffer.writeln("✨ شكراً لثقتكم في مجزر نهله! ✨");
  buffer.writeln("💚 نتمنى لكم يوماً سعيداً، وننتظركم دائماً!");

  buffer.writeln("🧾🧾🧾🧾🧾🧾🧾🧾🧾");

  buffer.writeln("Developed by: Mohamed Emam 👨‍💻");

  return buffer.toString();
}
