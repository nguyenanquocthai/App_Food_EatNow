import 'dart:io';
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class UploadProductForm extends StatefulWidget {
  static const routeName = '/UploadProductForm';

  const UploadProductForm({Key? key}) : super(key: key);

  @override
  _UploadProductFormState createState() => _UploadProductFormState();
}

class _UploadProductFormState extends State<UploadProductForm> {
  final _formKey = GlobalKey<FormState>();
  String _catValue = 'Vegetables';
  late final TextEditingController _titleController,
      _priceController,
      _qualityController,
      _sizeController;
  late final TextEditingController _restaurantIdController,
      _categoryIdController;
  int _groupValue = 1;
  bool isPiece = false;
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  List<Map<String, dynamic>> _products = [];

  @override
  void initState() {
    _priceController = TextEditingController();
    _titleController = TextEditingController();
    _qualityController = TextEditingController();
    _sizeController = TextEditingController();
    _restaurantIdController = TextEditingController();
    _categoryIdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _priceController.dispose();
    _titleController.dispose();
    _qualityController.dispose();
    _sizeController.dispose();
    _restaurantIdController.dispose();
    _categoryIdController.dispose();
    super.dispose();
  }

  void _uploadForm() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      if (_pickedImage == null) {
        _showErrorDialog('Please pick up an image');
        return;
      }

      final newProduct = {
        'title': _titleController.text,
        'price': _priceController.text,
        'quality': _qualityController.text,
        'size': _sizeController.text,
        'restaurant_id': _restaurantIdController.text,
        'category_id': _categoryIdController.text,
        'category': _catValue,
        'isPiece': isPiece,
        'image': kIsWeb ? webImage : _pickedImage,
      };

      setState(() {
        _products.add(newProduct);
        _clearForm();
      });

      Fluttertoast.showToast(
        msg: "Product uploaded successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Navigator.of(context).pop(newProduct); // Trả về sản phẩm mới
    }
  }

  void _clearForm() {
    isPiece = false;
    _groupValue = 1;
    _priceController.clear();
    _titleController.clear();
    _qualityController.clear();
    _sizeController.clear();
    setState(() {
      _pickedImage = null;
      webImage = Uint8List(8);
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
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
        title: const Text('Add Product'),
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
                key: _formKey,
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
                      key: const ValueKey('Title'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a Title';
                        }
                        return null;
                      },
                      decoration: inputDecoration,
                    ),
                    const SizedBox(height: 20),
                    Text('Price in \$*',
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        controller: _priceController,
                        key: const ValueKey('Price \$'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Price is missed';
                          }
                          return null;
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                        ],
                        decoration: inputDecoration,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Quality*',
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _qualityController,
                      key: const ValueKey('Quality'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the quality';
                        }
                        return null;
                      },
                      decoration: inputDecoration,
                    ),
                    const SizedBox(height: 20),
                    Text('Size*',
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _sizeController,
                      key: const ValueKey('Size'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the size';
                        }
                        return null;
                      },
                      decoration: inputDecoration,
                    ),
                    Text('Restaurant ID*',
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _restaurantIdController,
                      key: const ValueKey('Restaurant ID'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Restaurant ID';
                        }
                        return null;
                      },
                      decoration: inputDecoration,
                    ),
                    const SizedBox(height: 20),
                    Text('Category ID*',
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _categoryIdController,
                      key: const ValueKey('Category ID'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Category ID';
                        }
                        return null;
                      },
                      decoration: inputDecoration,
                    ),
                    const SizedBox(height: 20),
                    Text('Product category*',
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    _categoryDropDown(),
                    const SizedBox(height: 20),
                    Text('Measure unit*',
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('KG', style: TextStyle(color: color)),
                        Radio(
                          value: 1,
                          groupValue: _groupValue,
                          onChanged: (valuee) {
                            setState(() {
                              _groupValue = 1;
                              isPiece = false;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                        Text('Piece', style: TextStyle(color: color)),
                        Radio(
                          value: 2,
                          groupValue: _groupValue,
                          onChanged: (valuee) {
                            setState(() {
                              _groupValue = 2;
                              isPiece = true;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height:
                                  size.width > 650 ? 350 : size.width * 0.45,
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
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _pickedImage = null;
                                      webImage = Uint8List(8);
                                    });
                                  },
                                  child: Text('Clear image',
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: _clearForm,
                            child: Row(
                              children: [
                                Icon(Icons.dangerous),
                                const SizedBox(width: 5),
                                Text('Clear form'),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade700),
                          ),
                          ElevatedButton(
                            onPressed: _uploadForm,
                            child: Row(
                              children: [
                                Icon(Icons.upload),
                                const SizedBox(width: 5),
                                Text('Upload'),
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
            const SizedBox(height: 25),
            Text('Uploaded Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _products.length,
              itemBuilder: (ctx, index) {
                final product = _products[index];
                return ListTile(
                  title: Text(product['title']),
                  subtitle: Text(
                      'Price: \$${product['price']} - Quality: ${product['quality']} - Size: ${product['size']} - Restaurant ID: ${product['restaurant_id']} - Category ID: ${product['category_id']} - Category: ${product['category']}'),
                  leading: product['image'] is Uint8List
                      ? Image.memory(product['image'],
                          fit: BoxFit.cover, width: 50, height: 50)
                      : Image.file(product['image'],
                          fit: BoxFit.cover, width: 50, height: 50),
                );
              },
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
        border: Border.all(
            color: Theme.of(context).colorScheme.secondary, width: 1),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.image_outlined, size: 50),
              const SizedBox(height: 10),
              TextButton(
                onPressed: _pickImage,
                child: Text(
                  'Choose an image',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (pickedImage != null) {
      if (kIsWeb) {
        final f = await pickedImage.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a'); // Placeholder for web image
        });
      } else {
        final imageTemp = File(pickedImage.path);
        setState(() {
          _pickedImage = imageTemp;
        });
      }
    }
  }
}
