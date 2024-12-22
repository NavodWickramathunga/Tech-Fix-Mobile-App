import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import './form-test.dart'; // Import FormTest
import './form-test2.dart'; // Import FormTest2
import './form-test3.dart'; // Import FormTest3
import './form-consumer.dart'; // Import FormConsumer
import './form-order-confirmation.dart'; // Import FormOrderConfirmation
import './form-administrator.dart'; // Import FormAdministrator

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Enable device preview
      builder: (context) => const MyApp(), // Builder should return the app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Optional: removes debug banner
      useInheritedMediaQuery: true, // Add this for DevicePreview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Tech Fix App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(), // Update to HomeScreen
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tech Fix App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormTest()),
                );
              },
              child: const Text('Hardware Supplier Form'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormTest2()),
                );
              },
              child: const Text('Component Supplier Form'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormOrderTracking()),
                );
              },
              child: const Text('Inventory Check'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormConsumer()),
                );
              },
              child: const Text('Consumer Form'),
            ),
            ElevatedButton(
              onPressed: () {
                // Example order details
                final orderDetails = {
                  'consumerName': 'John Doe',
                  'itemNameId': '12345',
                  'quantity': '10',
                  'service': 'Hardware',
                };
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FormOrderConfirmation(orderDetails: orderDetails),
                  ),
                );
              },
              child: const Text('Order Confirmation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormAdministrator()),
                );
              },
              child: const Text('Administrator Form'),
            ),
          ],
        ),
      ),
    );
  }
}
