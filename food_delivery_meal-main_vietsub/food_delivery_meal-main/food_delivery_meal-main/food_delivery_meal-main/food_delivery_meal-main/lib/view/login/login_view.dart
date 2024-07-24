import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/extension.dart';
import 'package:food_delivery/common/globs.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import 'package:food_delivery/view/home/home_view.dart';
import 'package:food_delivery/view/login/rest_password_view.dart';
import 'package:food_delivery/view/login/sing_up_view.dart';
import 'package:food_delivery/view/main_tabview/main_tabview.dart';
import 'package:food_delivery/view/on_boarding/on_boarding_view.dart';

import '../../common/service_call.dart';
import '../../common_widget/round_icon_button.dart';
import '../../common_widget/round_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "Đăng Nhập",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "Chi Tiết Đăng Nhập",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Mật Khẩu",
                controller: txtPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: "Đăng Nhập",
                  onPressed: () {
                    // btnLogin();
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (context) => const SignUpView(),
                      builder: (context) => const MainTabView(),
                    ),
                  );
                    
                  }),
              const SizedBox(
                height: 4,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordView(),
                    ),
                  );
                },
                child: Text(
                  "Quên Mật Khẩu ?",
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Hoặc Đăng Nhập Với",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              RoundIconButton(
                icon: "assets/img/facebook_logo.png",
                title: "Đăng Nhập Với Facebook",
                color: const Color(0xff367FC0),
                onPressed: () {},
              ),
              const SizedBox(
                height: 25,
              ),
              RoundIconButton(
                icon: "assets/img/google_logo.png",
                title: "Đăng Nhập Với Google",
                color: const Color(0xffDD4B39),
                onPressed: () {},
              ),
              const SizedBox(
                height: 80,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (context) => const SignUpView(),
                      builder: (context) => const HomeView(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Chưa Có tài Khoản? ",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Đăng Ký Ngay",
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // //TODO: Action
  // void btnLogin() {
  //   if (!txtEmail.text.isEmail) {
  //     mdShowAlert(Globs.appName, MSG.enterEmail, () {});
  //     return;
  //   }

  //   if (txtPassword.text.length < 6) {
  //     mdShowAlert(Globs.appName, MSG.enterPassword, () {});
  //     return;
  //   }

  //   endEditing();

  //   serviceCallLogin({"email": txtEmail.text, "password": txtPassword.text, "push_token": "" });
  // }

  // //TODO: ServiceCall

  // void serviceCallLogin(Map<String, dynamic> parameter) {
  //   Globs.showHUD();

  //   ServiceCall.post(parameter, SVKey.svLogin,
  //       withSuccess: (responseObj) async {
  //     Globs.hideHUD();
  //     if (responseObj[KKey.status] == "1") {
        
  //       Globs.udSet( responseObj[KKey.payload] as Map? ?? {} , Globs.userPayload);
  //       Globs.udBoolSet(true, Globs.userLogin);

  //         Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(
  //           builder: (context) => const OnBoardingView(),
  //         ), (route) => false);
  //     } else {
  //       mdShowAlert(Globs.appName,
  //           responseObj[KKey.message] as String? ?? MSG.fail, () {});
  //     }
  //   }, failure: (err) async {
  //     Globs.hideHUD();
  //     mdShowAlert(Globs.appName, err.toString(), () {});
  //   });
  // }
}
