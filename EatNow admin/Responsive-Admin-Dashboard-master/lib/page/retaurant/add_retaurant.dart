import 'dart:io';
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class UploadRetaurantForm extends StatefulWidget {
  static const routeName = '/UploadProductForm';

  const UploadRetaurantForm({Key? key}) : super(key: key);

  @override
  _UploadRetaurantFormState createState() => _UploadRetaurantFormState();
}

class _UploadRetaurantFormState extends State<UploadRetaurantForm> {
  final _formKey = GlobalKey<FormState>();
  String _catValue = 'Nhà hàng QuocThai';
  late final TextEditingController _titleController, _priceController;
  int _groupValue = 1;
  bool isPiece = false;
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  List<Map<String, dynamic>> _products = [];

  @override
  void initState() {
    _priceController = TextEditingController();
    _titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _priceController.dispose();
    _titleController.dispose();
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

      // Thêm sản phẩm vào danh sách sản phẩm
      setState(() {
        _products.add({
          'title': _titleController.text,
          'price': _priceController.text,
          'category': _catValue,
          'isPiece': isPiece,
          'image': kIsWeb ? webImage : _pickedImage,
        });
        _clearForm();
      });

      Fluttertoast.showToast(
        msg: "Retaurant uploaded successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void _clearForm() {
    isPiece = false;
    _groupValue = 1;
    _priceController.clear();
    _titleController.clear();
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
        title: const Text('Add Retaurant'),
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
                    Text('Retaurant title*',
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
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: FittedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                //
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
                                      onChanged: (valuee) {
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
                                      onChanged: (valuee) {
                                        setState(() {
                                          _groupValue = 2;
                                          isPiece = true;
                                        });
                                      },
                                      activeColor: Colors.green,
                                    ),
                                  ],
                                )
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
            // Hiển thị danh sách sản phẩm
            const SizedBox(height: 25),
            Text('Uploaded Retaurant', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _products.length,
              itemBuilder: (ctx, index) {
                final product = _products[index];
                return ListTile(
                  title: Text(product['title']),
                  subtitle: Text('Price: \$${product['price']} - Retaurant: ${product['retaurant']}'),
                  leading: product['image'] is Uint8List
                      ? Image.memory(product['image'], fit: BoxFit.cover, width: 50, height: 50)
                      : Image.file(product['image'], fit: BoxFit.cover, width: 50, height: 50),
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
              hint: const Text('Select a Retaurant'),
              items: const [
                DropdownMenuItem(
                  value: 'Retaurant1',
                  child: Text('Retaurant1'),
                ),
                DropdownMenuItem(
                  value: 'Retaurant2',
                  child: Text('Retaurant2'),
                ),
                DropdownMenuItem(
                  value: 'Retaurant3',
                  child: Text('Retaurant3'),
                ),
                DropdownMenuItem(
                  value: 'Retaurant4',
                  child: Text('Retaurant4'),
                ),
                DropdownMenuItem(
                  value: 'Retaurant5',
                  child: Text('Retaurant5'),
                ),
                DropdownMenuItem(
                  value: 'Retaurant6',
                  child: Text('Retaurant6'),
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
