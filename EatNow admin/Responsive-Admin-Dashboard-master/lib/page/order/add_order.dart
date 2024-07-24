import 'package:flutter/material.dart';

class AddOrderPage extends StatefulWidget {
  @override
  _AddOrderPageState createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final _formKey = GlobalKey<FormState>();
  String customerName = '';
  String orderDate = '';
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Order'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Customer Name'),
                onSaved: (value) {
                  customerName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Order Date'),
                onSaved: (value) {
                  orderDate = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Total Amount'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  totalAmount = double.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Call API to add the order
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
