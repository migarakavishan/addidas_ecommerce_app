import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class StripeService {
  final String endpoint = "https://api.stripe.com/v1/payment_intents";

  Future<Map<String, dynamic>?> requestPaymentIntent(String amount) async {
    try {
      Response response = await post(Uri.parse(endpoint), headers: {
        "Authorization": "Bearer ${dotenv.env["SECRET_KEY"]}",
        "Content-Type": "application/x-www-form-urlencoded"
      }, body: {
        "amount": amount,
        "currency": "LKR",
      });
      Logger().f(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
