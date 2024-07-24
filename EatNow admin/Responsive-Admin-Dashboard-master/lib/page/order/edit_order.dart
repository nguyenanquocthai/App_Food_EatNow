import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/data/model/order.dart';

class EditOrderPage extends StatefulWidget {
  final Order order;

  EditOrderPage({required this.order});

  @override
  _EditOrderPageState createState() => _EditOrderPageState();
}

class _EditOrderPageState extends State<EditOrderPage> {
  final _formKey = GlobalKey<FormState>();
  late String customerName;
  late String orderDate;
  late double totalAmount;

  @override
  void initState() {
    super.initState();
    customerName = widget.order.customerName;
    orderDate = widget.order.orderDate;
    totalAmount = widget.order.totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Order'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: customerName,
                decoration: InputDecoration(labelText: 'Customer Name'),
                onSaved: (value) {
                  customerName = value!;
                },
              ),
              TextFormField(
                initialValue: orderDate,
                decoration: InputDecoration(labelText: 'Order Date'),
                onSaved: (value) {
                  orderDate = value!;
                },
              ),
              TextFormField(
                initialValue: totalAmount.toString(),
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
                    // Call API to update the order
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
