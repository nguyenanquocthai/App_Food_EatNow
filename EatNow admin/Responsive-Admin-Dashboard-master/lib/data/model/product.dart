// model/product.dart
class ProductModel {
  int? id;
  String name;
  double price;
  String img;
  String desc;
  int catid;

  ProductModel({
    this.id,
    required this.name,
    required this.price,
    required this.img,
    required this.desc,
    required this.catid,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'img': img,
      'desc': desc,
      'catid': catid,
    };
  }

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      price: map['price'].toDouble(),
      img: map['img'],
      desc: map['desc'],
      catid: map['catid'],
    );
  }
}
