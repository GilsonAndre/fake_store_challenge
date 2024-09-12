import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.paymentAppBar),
      ),
      body: const Center(
        child: Text('We working in this page',),
      ),
    );
  }
}
