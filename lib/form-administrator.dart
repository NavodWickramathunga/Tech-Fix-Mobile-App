import 'package:flutter/material.dart';

class FormAdministrator extends StatefulWidget {
  const FormAdministrator({super.key});

  @override
  State<FormAdministrator> createState() => _FormAdministratorState();
}

class _FormAdministratorState extends State<FormAdministrator> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedSupplier = 'Supplier 1'; // Default selected supplier
  List<Map<String, dynamic>> _currentQuotations = [
    {
      'itemNameId': 'Item 1',
      'quantity': '10',
      'suppliers': ['Supplier 1', 'Supplier 2', 'Supplier 3']
    },
    {
      'itemNameId': 'Item 2',
      'quantity': '5',
      'suppliers': ['Supplier 1', 'Supplier 2', 'Supplier 3']
    },
  ];
  List<Map<String, dynamic>> _quotationHistory = [
    {
      'itemNameId': 'Item 3',
      'quantity': '20',
      'supplier': 'Supplier 1',
      'date': '2023-01-01'
    },
    {
      'itemNameId': 'Item 4',
      'quantity': '15',
      'supplier': 'Supplier 2',
      'date': '2023-01-02'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Administrator Form',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Current Quotation Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 16),
                ..._currentQuotations.map((quotation) {
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
                          Text(
                            'Item Name / ID: ${quotation['itemNameId']}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Quantity: ${quotation['quantity']}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Select Supplier:',
                            style: TextStyle(fontSize: 18),
                          ),
                          ...quotation['suppliers'].map<Widget>((supplier) {
                            return RadioListTile<String>(
                              title: Text(supplier),
                              value: supplier,
                              groupValue: _selectedSupplier,
                              onChanged: (value) {
                                setState(() {
                                  _selectedSupplier = value!;
                                });
                              },
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                const SizedBox(height: 16),
                const Text(
                  'Quotation History',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 16),
                ..._quotationHistory.map((history) {
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
                          Text(
                            'Item Name / ID: ${history['itemNameId']}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Quantity: ${history['quantity']}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Supplier: ${history['supplier']}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Date: ${history['date']}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
