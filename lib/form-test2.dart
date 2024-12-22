import 'package:flutter/material.dart';

class FormTest2 extends StatefulWidget {
  const FormTest2({super.key});

  @override
  State<FormTest2> createState() => _FormTest2State();
}

class _FormTest2State extends State<FormTest2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _itemNameIdComponentSupplier = '';

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
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'This field cannot be empty';
        }
        if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text)) {
          return 'Please enter only letters and numbers';
        }
        return null;
      },
      onSaved: (text) {
        _itemNameIdComponentSupplier = text ?? '';
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
          return 'Price per unit cannot be empty';
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

  Widget _biuldiscountField() {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Discount',
        hintText: 'Enter the discount',
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
          return 'Discount cannot be empty';
        }
        if (int.tryParse(text) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
      onSaved: (value) {
        // _discount = int.tryParse(value ?? '0') ?? 0;
      },
    );
  }

  Widget _buildQuantityField() {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Quantity',
        hintText: 'Enter the quantity',
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
        prefixIcon:
            const Icon(Icons.format_list_numbered, color: Colors.purple),
      ),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Quantity cannot be empty';
        }
        if (int.tryParse(text) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
      onSaved: (value) {
        // _quantity = int.tryParse(value ?? '0') ?? 0;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Component Supplier Form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
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
            child: Card(
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
                      const Text(
                        'Enter Your Details',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildItemNameIdField(),
                      const SizedBox(height: 16),
                      _buildPricePerUnitField(),
                      const SizedBox(height: 16),
                      _biuldiscountField(),
                      const SizedBox(height: 16),
                      _buildQuantityField(),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _formKey.currentState?.save();
                              print(
                                  'Saved value: $_itemNameIdComponentSupplier');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 189, 177, 208),
                          ),
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
