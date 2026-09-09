import 'package:flutter/material.dart';
import 'package:payscribe_checkout_flutter/payscribe_checkout_flutter.dart';

void main() => runApp(const CheckoutExampleApp());

class CheckoutExampleApp extends StatelessWidget {
  const CheckoutExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payscribe Checkout Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff214dc0)),
        useMaterial3: true,
      ),
      home: const CheckoutExampleScreen(),
    );
  }
}

class CheckoutExampleScreen extends StatelessWidget {
  const CheckoutExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payscribe Hosted Checkout')),
      body: Center(
        child: FilledButton(
          onPressed: () async {
            final result = await PayscribeCheckout.open(
              context: context,
              sessionToken: 'btn_REPLACE_WITH_A_SERVER_SESSION',
              onReady: (result) => debugPrint('Checkout ready: ${result.data}'),
              onSuccess: (result) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Paid: ${result.reference ?? 'success'}'),
                  ),
                );
              },
              onError: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error.message ?? 'Checkout failed')),
                );
              },
              onClose: (result) => debugPrint('Checkout closed: ${result.data}'),
            );

            debugPrint('Final checkout result: ${result?.data}');
          },
          child: const Text('Open checkout'),
        ),
      ),
    );
  }
}
