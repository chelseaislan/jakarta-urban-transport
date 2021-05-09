import 'package:get/get.dart';
import 'package:krl_access_clone/model/payment_method_model.dart';

// Currently unused
class PaymentController extends GetxController {
  var paymentController = <PaymentMethod>[].obs;

  @override
  void onInit() {
    fetchPayment();
    super.onInit();
  }

  void fetchPayment() {
    var paymentResult = [
      PaymentMethod("assets/icons/bca.png", "Bank BCA", "Transfer to VA BCA", false),
      PaymentMethod("assets/icons/bni.png", "Bank BNI", "Transfer to VA BNI", false),
      PaymentMethod(
          "assets/icons/mandiri.png", "Bank Mandiri", "Transfer to VA Mandiri", false),
      PaymentMethod(
          "assets/icons/permata.png", "Bank Permata", "Transfer to VA Permata", false),
      PaymentMethod("assets/icons/jago.png", "Bank Jago",
          "Instant Payment with Jago Pay", false),
      PaymentMethod("assets/icons/card.png", "Debit/Credit Card",
          "Accepts Visa and Mastercard", false),
    ];
    paymentController.assignAll(paymentResult);
  }
}
