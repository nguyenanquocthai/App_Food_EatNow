import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/data/model/order.dart';
import 'package:responsive_admin_dashboard/page/order/add_order.dart';
import 'package:responsive_admin_dashboard/page/order/edit_order.dart';

class OrderManagementPage extends StatefulWidget {
  @override
  _OrderManagementPageState createState() => _OrderManagementPageState();
}

class _OrderManagementPageState extends State<OrderManagementPage> {
  List<Order> orders = [];

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    // Replace with your API call to fetch orders
    // For now, using dummy data
    setState(() {
      orders = [
        Order(
          id: '1',
          customerName: 'John Doe',
          orderDate: '2024-07-18',
          totalAmount: 29.99,
        ),
        Order(
          id: '2',
          customerName: 'Jane Smith',
          orderDate: '2024-07-19',
          totalAmount: 49.99,
        ),
      ];
    });
  }

  Future<void> addOrder(Order order) async {
    // Call API to add order
    // If successful, update the orders list
    setState(() {
      orders.add(order);
    });
  }

  Future<void> updateOrder(Order updatedOrder) async {
    // Call API to update order
    // If successful, update the orders list
    setState(() {
      int index = orders.indexWhere((order) => order.id == updatedOrder.id);
      if (index != -1) {
        orders[index] = updatedOrder;
      }
    });
  }

  void deleteOrder(String id) {
    // Call API to delete order
    setState(() {
      orders.removeWhere((order) => order.id == id);
    });
  }

  void editOrder(Order order) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditOrderPage(order: order),
      ),
    ).then((updatedOrder) {
      if (updatedOrder != null) {
        updateOrder(updatedOrder);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddOrderPage()),
              ).then((newOrder) {
                if (newOrder != null) {
                  addOrder(newOrder);
                }
              });
            },
          ),
        ],
      ),
      body: orders.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  title: Text(order.customerName),
                  subtitle: Text('Order Date: ${order.orderDate}\nTotal: \$${order.totalAmount}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          editOrder(order);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteOrder(order.id);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    // Handle order tap (e.g., navigate to order details)
                  },
                );
              },
            ),
    );
  }
}
