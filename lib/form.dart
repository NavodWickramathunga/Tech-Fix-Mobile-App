import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _itemNameId = '';

  FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tech Fix App',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the title bold
            fontSize: 30, // Optional: increase the font size
            color: Colors.black, // Optional: change the color
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Big Title',
                  style: TextStyle(
                    fontSize: 32, // Larger font size for the big title
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Optional: add color to the title
                  ),
                ),
                const SizedBox(
                    height: 16), // Add some space below the big title
                const Text(
                  'Enter Your Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Optional: add color to the heading
                  ),
                ),
                const SizedBox(height: 16), // Add some space below the heading
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          _buildItemNameIdField(),
                          const SizedBox(height: 16),
                          _buildPricePerUnitField(),
                          const SizedBox(height: 16),
                          _buildBulkDiscountRate(),
                          const SizedBox(height: 32),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  _formKey.currentState?.save();
                                  print('Saved value: $_itemNameId');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 20), // Increase button size
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black, // Increase text size
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 242, 153, 222),
                              ),
                              child: const Text('Save'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemNameIdField() {
    return TextFormField(
      maxLength: 15,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Enter the Item Name / ID',
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.purple[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple, width: 2.0),
        ),
        prefixIcon: const Icon(Icons.text_fields, color: Colors.purple),
      ),
      validator: (text) => HelperValidator.nameidValidate(text ?? ''),
      onSaved: (text) {
        _itemNameId = text ?? '';
      },
    );
  }

  Widget _buildPricePerUnitField() {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Price Per Unit',
        hintText: 'Enter the price',
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.purple[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple, width: 2.0),
        ),
        prefixIcon: const Icon(Icons.attach_money, color: Colors.purple),
      ),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Price cannot be empty';
        }
        if (int.tryParse(text) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
      onSaved: (value) {
        // _pricePerUnit = int.tryParse(value ?? '0') ?? 0;
      },
    );
  }

  Widget _buildBulkDiscountRate() {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Bulk Discount Rate',
        hintText: 'Enter the discount rate',
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.purple[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple, width: 2.0),
        ),
        prefixIcon: const Icon(Icons.percent, color: Colors.purple),
      ),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Discount rate cannot be empty';
        }
        if (int.tryParse(text) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
      onSaved: (value) {
        // _bulkDiscountRate = int.tryParse(value ?? '0') ?? 0;
      },
    );
  }
}

class HelperValidator {
  static String? nameidValidate(String value) {
    if (value.isEmpty) {
      return "Item Name / ID can't be empty";
    }
    if (value.length < 2) {
      return "Item Name / ID must be at least 2 characters long";
    }
    if (value.length > 50) {
      return "Item Name / ID must be less than 50 characters long";
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'Please enter only letters and numbers';
    }
    return null;
  }
}
