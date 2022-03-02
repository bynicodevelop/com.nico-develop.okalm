import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_purchase/in_app_purchase.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // final client = http.Client();

  @override
  void initState() {
    super.initState();

    const Set<String> _kIds = <String>{'tester'};

    InAppPurchase.instance
        .queryProductDetails(_kIds)
        .then((value) => print(value.productDetails));

    // Stripe.publishableKey = "pk_test_BkfpdgRNi7GWgd1vtXe9KBZy00qIm1JmKv";
    // Stripe.merchantIdentifier = "merchant.com.nico-develop";

    // Stripe.instance.applySettings();
  }

  // static Map<String, String> headers = {
  //   'Authorization':
  //       'Bearer sk_test_51Gb1eqKRrqcWAq6Ia7PPxKiu3JxSw2drZ9t5we7BBAG021qRZsP1StSyNlVyccANDbKqX1KmZD3ITDqvKyhoyTfe00TUHTTfGn',
  //   'Content-Type': 'application/x-www-form-urlencoded'
  // };

  // Future<Map<String, dynamic>> _createCustomer() async {
  //   const String url = 'https://api.stripe.com/v1/customers';

  //   var response = await client.post(
  //     Uri.parse(url),
  //     headers: headers,
  //     body: {
  //       'description': 'new customer',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     print(json.decode(response.body));
  //     throw 'Failed to register as a customer.';
  //   }
  // }

  // Future<Map<String, dynamic>> _createPaymentIntents() async {
  //   const String url = 'https://api.stripe.com/v1/payment_intents';

  //   Map<String, dynamic> body = {
  //     'amount': '999',
  //     'currency': 'eur',
  //     'payment_method_types[]': 'card'
  //   };

  //   var response =
  //       await client.post(Uri.parse(url), headers: headers, body: body);
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     print(json.decode(response.body));
  //     throw 'Failed to create PaymentIntents.';
  //   }
  // }

  // Future<void> _createCreditCard(
  //   String customerId,
  //   String paymentIntentClientSecret,
  // ) async {
  //   await Stripe.instance.initPaymentSheet(
  //     paymentSheetParameters: SetupPaymentSheetParameters(
  //       applePay: true,
  //       testEnv: true,
  //       merchantCountryCode: 'JP',
  //       merchantDisplayName: 'Flutter Stripe Store Demo',
  //       customerId: customerId,
  //       paymentIntentClientSecret: paymentIntentClientSecret,
  //     ),
  //   );

  //   await Stripe.instance.presentPaymentSheet();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 16,
              ),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/icon-512x512.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Text(
                "ÔKalm",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Text(
                "Accéder à la version complète de l'application.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            // TextButton(
            //   onPressed: () async {
            //     print(await Stripe.instance.checkApplePaySupport());

            //     await Stripe.instance.openApplePaySetup();
            //   },
            //   child: Text("Coucou"),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ApplePayButton(
                onPressed: () async {
                  // ApplePayCartSummaryItem applePayCartSummaryItem =
                  //     const ApplePayCartSummaryItem(
                  //   label: "Accès complet",
                  //   amount: "9.99",
                  // );

                  // ApplePayPresentParams applePayPresentParams =
                  //     ApplePayPresentParams(
                  //   cartItems: [applePayCartSummaryItem],
                  //   country: "FR",
                  //   currency: "EUR",
                  // );

                  // Stripe.instance.presentApplePay(applePayPresentParams);

                  // final _customer = await _createCustomer();
                  // final _paymentIntent = await _createPaymentIntents();

                  // await _createCreditCard(
                  //   _customer['id'],
                  //   _paymentIntent['client_secret'],
                  // );

                  // SetupPaymentSheetParameters(
                  //   applePay: true,
                  //   currencyCode: "EUR",
                  // )
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
