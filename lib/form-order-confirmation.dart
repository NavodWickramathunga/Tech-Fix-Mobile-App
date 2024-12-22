import 'package:flutter/material.dart';

class FormOrderConfirmation extends StatefulWidget {
  final Map<String, dynamic> orderDetails;

  const FormOrderConfirmation({super.key, required this.orderDetails});

  @override
  State<FormOrderConfirmation> createState() => _FormOrderConfirmationState();
}

class _FormOrderConfirmationState extends State<FormOrderConfirmation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Confirmation',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Confirm Your Order Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Consumer Name: ${widget.orderDetails['consumerName']}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Item Name / ID: ${widget.orderDetails['itemNameId']}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Quantity: ${widget.orderDetails['quantity']}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Service: ${widget.orderDetails['service']}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle order confirmation logic here
                      print('Order confirmed: ${widget.orderDetails}');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: const Color.fromARGB(255, 189, 177, 208),
                    ),
                    child: const Text('Confirm Order'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
