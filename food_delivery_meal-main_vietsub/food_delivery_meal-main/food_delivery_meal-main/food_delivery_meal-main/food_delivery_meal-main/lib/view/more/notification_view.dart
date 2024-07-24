import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';

import 'my_order_view.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  List notificationArr = [
    {
      "title": "Đơn đặt hàng của bạn đã được nhận",
      "time": "Bây Giờ",
    },
    {
      "title": "Đơn hàng của bạn đã được giao",
      "time": "1 Tiếng Trước",
    },
    {
      "title": "Đơn đặt hàng của bạn đã được nhận",
      "time": "3 Tiếng Trước",
    },
    {
      "title": "Đơn hàng của bạn đã được giao",
      "time": "5 Tiếng Trước",
    },
    {
      "title": "Đơn đặt hàng của bạn đã được nhận",
      "time": "5 tháng 6 2023",
    },
    {
      "title": "Đơn hàng của bạn đã được giao",
      "time": "2 tháng 3 2024",
    },
    {
      "title": "Đơn đặt hàng của bạn đã được nhận",
      "time": "2 tháng 3 2024",
    },
    {
      "title": "Đơn hàng của bạn đã được giao",
      "time": "2 tháng 3 2024",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset("assets/img/btn_back.png",
                          width: 20, height: 20),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        "Thông Báo",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: notificationArr.length,
                separatorBuilder: ((context, index) => Divider(
                  indent: 25,
                  endIndent: 25,
                      color: TColor.secondaryText.withOpacity(0.4),
                      height: 1,
                    )),
                itemBuilder: ((context, index) {
                  var cObj = notificationArr[index] as Map? ?? {};
                  return Container(
                    decoration: BoxDecoration(color: index % 2 == 0 ? TColor.white : TColor.textfield ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: TColor.primary,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cObj["title"].toString(),
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                cObj["time"].toString(),
                                style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
