import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

class EditProductForm extends StatefulWidget {
  final Map<String, dynamic> product;

  const EditProductForm({Key? key, required this.product}) : super(key: key);

  @override
  _EditProductFormState createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late String _catValue;
  late int _groupValue;
  late bool isPiece;
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.product['title']);
    _priceController = TextEditingController(text: widget.product['price']);
    _catValue = widget.product['category'];
    isPiece = widget.product['isPiece'];
    _groupValue = isPiece ? 2 : 1;
    if (widget.product['image'] is Uint8List) {
      webImage = widget.product['image'];
    } else {
      _pickedImage = widget.product['image'];
    }
    super.initState();
  }

  @override
  void dispose() {
    _priceController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void _updateProduct() {
    if (_titleController.text.isEmpty || _priceController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please fill all fields",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    final updatedProduct = {
      'title': _titleController.text,
      'price': _priceController.text,
      'category': _catValue,
      'isPiece': isPiece,
      'image': kIsWeb ? webImage : _pickedImage,
    };

    Navigator.of(context).pop({'action': 'update', 'product': updatedProduct});
  }

  void _deleteProduct() {
    Navigator.of(context).pop({'action': 'delete'});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.secondary;
    final _scaffoldColor = theme.scaffoldBackgroundColor;
    Size size = MediaQuery.of(context).size;

    var inputDecoration = InputDecoration(
      filled: true,
      fillColor: _scaffoldColor,
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1.0,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Container(
              width: size.width > 650 ? 650 : size.width,
              color: theme.cardColor,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Product title*',
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _titleController,
                      decoration: inputDecoration,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: FittedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Price in \$*',
                                    style: TextStyle(
                                        color: color,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 100,
                                  child: TextFormField(
                                    controller: _priceController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9.]')),
                                    ],
                                    decoration: inputDecoration,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text('Product category*',
                                    style: TextStyle(
                                        color: color,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                _categoryDropDown(),
                                const SizedBox(height: 20),
                                Text('Measure unit*',
                                    style: TextStyle(
                                        color: color,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('KG', style: TextStyle(color: color)),
                                    Radio(
                                      value: 1,
                                      groupValue: _groupValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _groupValue = 1;
                                          isPiece = false;
                                        });
                                      },
                                      activeColor: Colors.green,
                                    ),
                                    Text('Piece',
                                        style: TextStyle(color: color)),
                                    Radio(
                                      value: 2,
                                      groupValue: _groupValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _groupValue = 2;
                                          isPiece = true;
                                        });
                                      },
                                      activeColor: Colors.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: size.width > 650 ? 350 : size.width * 0.45,
                              decoration: BoxDecoration(
                                color: theme.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: _pickedImage == null
                                  ? dottedBorder(color: color)
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: kIsWeb
                                          ? Image.memory(webImage,
                                              fit: BoxFit.fill)
                                          : Image.file(_pickedImage!,
                                              fit: BoxFit.fill),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: _deleteProduct,
                            child: Row(
                              children: [
                                Icon(Icons.delete),
                                const SizedBox(width: 5),
                                Text('Delete'),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade700),
                          ),
                          ElevatedButton(
                            onPressed: _updateProduct,
                            child: Row(
                              children: [
                                Icon(Icons.update),
                                const SizedBox(width: 5),
                                Text('Update'),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryDropDown() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              value: _catValue,
              onChanged: (value) {
                setState(() {
                  _catValue = value!;
                });
              },
              hint: const Text('Select a category'),
              items: const [
                DropdownMenuItem(
                  value: 'Vegetables',
                  child: Text('Vegetables'),
                ),
                DropdownMenuItem(
                  value: 'Fruits',
                  child: Text('Fruits'),
                ),
                DropdownMenuItem(
                  value: 'Grains',
                  child: Text('Grains'),
                ),
                DropdownMenuItem(
                  value: 'Nuts',
                  child: Text('Nuts'),
                ),
                DropdownMenuItem(
                  value: 'Herbs',
                  child: Text('Herbs'),
                ),
                DropdownMenuItem(
                  value: 'Spices',
                  child: Text('Spices'),
                ),
              ]),
        ),
      ),
    );
  }

  Widget dottedBorder({required Color color}) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      dashPattern: const [10, 6],
      color: color,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.image, size: 50, color: Colors.grey),
            TextButton(
              onPressed: () {},
              child: Text('Select image',
                  style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
