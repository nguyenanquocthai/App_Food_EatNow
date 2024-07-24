import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_button.dart';

import '../../common_widget/popular_resutaurant_row.dart';
import '../more/my_order_view.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  TextEditingController txtSearch = TextEditingController();

  List offerArr = [
    {
      "image": "assets/img/offer_1.png",
      "name": "Buổi Sáng Dinh Dưỡng",
      "rate": "4.9",
      "rating": "124",
      "type": "Đồ Ăn Nhẹ",
      "food_type": "Món Khai Vị"
    },
    {
      "image": "assets/img/offer_2.png",
      "name": "Gỏi cuốn chiên",
      "rate": "4.9",
      "rating": "124",
      "type": "Đồ Ăn Vặt",
      "food_type": "Gỏi"
    },
    {
      "image": "assets/img/offer_3.png",
      "name": "Cà Phê Sữa Nhiều",
      "rate": "4.9",
      "rating": "124",
      "type": "Thức Uống",
      "food_type": "Cà phê"
    },
    // {
    //   "image": "assets/img/offer_1.png",
    //   "name": "Café de Noires",
    //   "rate": "4.9",
    //   "rating": "124",
    //   "type": "Cafa",
    //   "food_type": "Western Food"
    // },
    // {
    //   "image": "assets/img/offer_2.png",
    //   "name": "Isso",
    //   "rate": "4.9",
    //   "rating": "124",
    //   "type": "Cafa",
    //   "food_type": "Western Food"
    // },
    // {
    //   "image": "assets/img/offer_3.png",
    //   "name": "Cafe Beans",
    //   "rate": "4.9",
    //   "rating": "124",
    //   "type": "Cafa",
    //   "food_type": "Western Food"
    // },
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tất cả đề xuất",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tìm các khoản giảm giá, Ưu đãi\nbữa ăn đặc biệt!",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 140,
                  height: 30,
                  child: RoundButton(title: "Kiểm Tra Đề Xuất", fontSize: 12 , onPressed: () {}),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: offerArr.length,
                itemBuilder: ((context, index) {
                  var pObj = offerArr[index] as Map? ?? {};
                  return PopularRestaurantRow(
                    pObj: pObj,
                    onTap: () {},
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
