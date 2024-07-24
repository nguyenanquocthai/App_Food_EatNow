import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/page/product/add_product.dart';
import 'package:responsive_admin_dashboard/page/product/edit_product.dart';


class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Map<String, dynamic>> products = [];

  void _navigateToAddProduct() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UploadProductForm()),
    );
    if (result != null) {
      setState(() {
        products.add(result);
      });
    }
  }

  void _navigateToEditProduct(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditProductForm(product: products[index])),
    );

    if (result != null) {
      if (result['action'] == 'update') {
        setState(() {
          products[index] = result['product'];
        });
      } else if (result['action'] == 'delete') {
        setState(() {
          products.removeAt(index);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['title']),
            subtitle: Text('\$${products[index]['price']}'),
            leading: products[index]['image'] is Uint8List
                ? Image.memory(products[index]['image'],
                    fit: BoxFit.cover, width: 50, height: 50)
                : Image.file(products[index]['image'],
                    fit: BoxFit.cover, width: 50, height: 50),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _navigateToEditProduct(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddProduct,
        child: Icon(Icons.add),
      ),
    );
  }
}
