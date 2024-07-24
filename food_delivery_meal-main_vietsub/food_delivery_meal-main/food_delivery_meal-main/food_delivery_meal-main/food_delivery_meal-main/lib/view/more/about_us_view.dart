import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';

import 'my_order_view.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  List aboutTextArr = [
    "Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng điều đó sẽ xảy ra vào thời điểm có rất nhiều công sức và đau đớn. Để đi đến chi tiết nhỏ nhất, không ai nên thực hiện bất kỳ loại công việc nào trừ khi anh ta thu được lợi ích nào đó từ nó. Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui mà anh ấy muốn được thoát khỏi nỗi đau với hy vọng rằng không có sự sinh sản. Trừ khi họ bị dục vọng làm cho mù quáng, nếu không họ sẽ không bước ra; họ có lỗi khi từ bỏ nhiệm vụ của mình và làm mềm lòng, tức là lao động của họ.",
    "Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng điều đó sẽ xảy ra vào thời điểm có rất nhiều công sức và đau đớn. Để đi đến chi tiết nhỏ nhất, không ai nên thực hiện bất kỳ loại công việc nào trừ khi anh ta thu được lợi ích nào đó từ nó. Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui mà anh ấy muốn được thoát khỏi nỗi đau với hy vọng rằng không có sự sinh sản. Trừ khi họ bị dục vọng làm cho mù quáng, nếu không họ sẽ không bước ra; họ có lỗi khi từ bỏ nhiệm vụ của mình và làm mềm lòng, tức là lao động của họ.",
    "Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng điều đó sẽ xảy ra vào thời điểm có rất nhiều công sức và đau đớn. Để đi đến chi tiết nhỏ nhất, không ai nên thực hiện bất kỳ loại công việc nào trừ khi anh ta thu được lợi ích nào đó từ nó. Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui mà anh ấy muốn được thoát khỏi nỗi đau với hy vọng rằng không có sự sinh sản. Trừ khi họ bị dục vọng làm cho mù quáng, nếu không họ sẽ không bước ra; họ có lỗi khi từ bỏ nhiệm vụ của mình và làm mềm lòng, tức là lao động của họ.",
    "Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng điều đó sẽ xảy ra vào thời điểm có rất nhiều công sức và đau đớn. Để đi đến chi tiết nhỏ nhất, không ai nên thực hiện bất kỳ loại công việc nào trừ khi anh ta thu được lợi ích nào đó từ nó. Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui mà anh ấy muốn được thoát khỏi nỗi đau với hy vọng rằng không có sự sinh sản. Trừ khi họ bị dục vọng làm cho mù quáng, nếu không họ sẽ không bước ra; họ có lỗi khi từ bỏ nhiệm vụ của mình và làm mềm lòng, tức là lao động của họ.",
    "Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng điều đó sẽ xảy ra vào thời điểm có rất nhiều công sức và đau đớn. Để đi đến chi tiết nhỏ nhất, không ai nên thực hiện bất kỳ loại công việc nào trừ khi anh ta thu được lợi ích nào đó từ nó. Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui mà anh ấy muốn được thoát khỏi nỗi đau với hy vọng rằng không có sự sinh sản. Trừ khi họ bị dục vọng làm cho mù quáng, nếu không họ sẽ không bước ra; họ có lỗi khi từ bỏ nhiệm vụ của mình và làm mềm lòng, tức là lao động của họ.",
    "Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng điều đó sẽ xảy ra vào thời điểm có rất nhiều công sức và đau đớn. Để đi đến chi tiết nhỏ nhất, không ai nên thực hiện bất kỳ loại công việc nào trừ khi anh ta thu được lợi ích nào đó từ nó. Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui mà anh ấy muốn được thoát khỏi nỗi đau với hy vọng rằng không có sự sinh sản. Trừ khi họ bị dục vọng làm cho mù quáng, nếu không họ sẽ không bước ra; họ có lỗi khi từ bỏ nhiệm vụ của mình và làm mềm lòng, tức là lao động của họ.",
    
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
                        "About Us",
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
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: aboutTextArr.length,
               
                itemBuilder: ((context, index) {
                  var txt = aboutTextArr[index] as String? ?? "";
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: TColor.primary,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            txt,
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 14),
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
