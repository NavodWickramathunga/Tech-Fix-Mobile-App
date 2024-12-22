import 'package:flutter/material.dart';

class FormConsumer extends StatefulWidget {
  const FormConsumer({super.key});

  @override
  State<FormConsumer> createState() => _FormConsumerState();
}

class _FormConsumerState extends State<FormConsumer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _consumerName = '';
  String _selectedService = 'Hardware'; //Default value

  Widget _buildConsumerNameField() {
    return TextFormField(
      maxLength: 30,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Enter the Consumer Name',
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
        prefixIcon: const Icon(Icons.person, color: Colors.purple),
      ),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
      onSaved: (text) {
        _consumerName = text ?? '';
      },
    );
  }

  Widget _builditemnameidField() {
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
        _consumerName = text ?? '';
      },
    );
  }

  Widget _buildquantityField() {
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
        _consumerName = text ?? '';
      },
    );
  }

  Widget _buildServiceField() {
    return DropdownButtonFormField<String>(
      value: _selectedService,
      decoration: InputDecoration(
        hintText: 'Select Service',
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
        prefixIcon: const Icon(Icons.build, color: Colors.purple),
      ),
      items: <String>['Hardware', 'Components'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedService = newValue!;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a service';
        }
        return null;
      },
      onSaved: (value) {
        _selectedService = value ?? 'Hardware';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Consumer Form',
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Enter Consumer Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                _buildConsumerNameField(),
                const SizedBox(height: 16),
                _builditemnameidField(),
                const SizedBox(height: 16),
                _buildquantityField(),
                const SizedBox(height: 16),
                _buildServiceField(),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        print('Saved value: $_consumerName');
                        print('Selected service: $_selectedService');
                      }
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
                    child: const Text('Save'),
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
