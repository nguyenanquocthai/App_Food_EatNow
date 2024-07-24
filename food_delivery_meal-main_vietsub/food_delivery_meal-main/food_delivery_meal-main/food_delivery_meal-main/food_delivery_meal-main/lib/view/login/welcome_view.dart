import 'package:flutter/material.dart';
import 'package:food_delivery/view/login/login_view.dart';
import 'package:food_delivery/view/login/sing_up_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  "assets/img/welcome_top_shape.png",
                  width: media.width,
                ),
                ClipOval(
                  child: Image.asset(
                  "assets/img/logo_app.png",
                  width: media.width * 0.55,
                  height: media.width * 0.55,
                  fit: BoxFit.contain,)
                ),
              ],
            ),
            SizedBox(
              height: media.width * 0.1,
            ),
            Text(
              "Khám phá những món ăn ngon nhất từ ​​hơn 1.000\n nhà hàng và giao hàng nhanh\n đến tận nhà bạn",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: media.width * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(
                title: "Đăng Nhập",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(
                title: "Tạo Tài Khoản",
                type: RoundButtonType.textPrimary,
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
