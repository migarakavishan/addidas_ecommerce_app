import 'package:addidas_ecommerce_app/services/stripe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:logger/logger.dart';

class PaymentProvider extends ChangeNotifier {
  final StripeService service = StripeService();

  Future<void> getPayment(String amount) async {
    try {
      Map<String, dynamic>? intent = await service.requestPaymentIntent(amount);

      if (intent != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: intent['client_secret'],
                merchantDisplayName:
                    "Adidas App")); // Ensure the name is spelled correctly as "Adidas".

        // Check if the payment sheet can be presented
        var canPresent = await Stripe.instance.presentPaymentSheet();

        if (canPresent != null) {
          await Stripe.instance.presentPaymentSheet().then((value) {
            Logger().f("Payment Success");
          });
        } else {
          Logger().e(
              "Cannot present the payment sheet, possibly due to initialization issues.");
        }
      } else {
        Logger().e(
            "Payment intent was null, something went wrong with the intent creation.");
      }
    } on StripeException catch (e) {
      Logger().e("Stripe Exception: ${e.error.localizedMessage}");
      rethrow; // Optionally rethrow to handle it higher in your application
    } catch (e) {
      Logger().e("An error occurred: $e");
      rethrow;
    }
  }
}

// class PaymentProvider extends ChangeNotifier {
//   StripeService service = StripeService();

//   Future<void> getPayment(String amount) async {
//     Map<String, dynamic>? intent = await service.requestPaymentIntent(amount);

//     if (intent != null) {
//       await Stripe.instance.initPaymentSheet(
//           paymentSheetParameters: SetupPaymentSheetParameters(
//               paymentIntentClientSecret: intent['client_secret'],
//               merchantDisplayName: "Addidas App"));
//       await Stripe.instance.presentCustomerSheet().then((value) {
//         Logger().f("Payment Success");
//       });
//     } else {
//       Logger().e("Something went wrong");
//     }
//   }
// }