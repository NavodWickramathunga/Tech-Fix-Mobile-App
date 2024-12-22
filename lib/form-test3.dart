import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormOrderTracking extends StatefulWidget {
  const FormOrderTracking({super.key});

  @override
  State<FormOrderTracking> createState() => _FormOrderTrackingState();
}

class _FormOrderTrackingState extends State<FormOrderTracking> {
  final TextEditingController _orderIdController = TextEditingController();
  Map<String, dynamic>? _orderStatus;

  Future<void> _fetchOrderStatus(String orderId) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$orderId'));
    if (response.statusCode == 200) {
      setState(() {
        _orderStatus = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load order status');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracking System'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _orderIdController,
              decoration: InputDecoration(
                hintText: 'Enter Order ID',
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_orderIdController.text.isNotEmpty) {
                  _fetchOrderStatus(_orderIdController.text);
                }
              },
              child: const Text('Check Status'),
            ),
            const SizedBox(height: 16),
            _orderStatus != null
                ? _buildOrderStatus()
                : const Text('Enter an Order ID to view status'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatus() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Order ID: ${_orderStatus!['id']}'),
            const SizedBox(height: 8),
            Text('Title: ${_orderStatus!['title']}'),
            const SizedBox(height: 8),
            Text('Status: ${_orderStatus!['body']}'), // Assuming 'body' represents status for demonstration
          ],
        ),
      ),
    );
  }
}
