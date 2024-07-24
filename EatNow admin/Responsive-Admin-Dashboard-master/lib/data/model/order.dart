class Order {
  final String id;
  final String customerName;
  final String orderDate;
  final double totalAmount;

  Order({
    required this.id,
    required this.customerName,
    required this.orderDate,
    required this.totalAmount,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customerName: json['customerName'],
      orderDate: json['orderDate'],
      totalAmount: json['totalAmount'].toDouble(),
    );
  }
}
