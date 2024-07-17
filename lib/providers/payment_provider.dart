import 'package:addidas_ecommerce_app/services/stripe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:logger/logger.dart';

class PaymentProvider extends ChangeNotifier {
  StripeService service = StripeService();

  Future<void> getPayment(String amount) async {
    Map<String, dynamic>? intent = await service.requestPaymentIntent(amount);

    if (intent != null) {
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: intent['client_secret'],
              merchantDisplayName: "Addidas App"));
      await Stripe.instance.presentCustomerSheet().then((value) {
        Logger().f("Payment Success");
      });
    } else {
      Logger().e("Something went wrong");
    }
  }
}
