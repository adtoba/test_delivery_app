import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_delivery_app/style/palette.dart';
import 'package:test_delivery_app/style/textstyle.dart';
import 'package:test_delivery_app/utils/dimensions.dart';
import 'package:test_delivery_app/utils/extensions.dart';
import 'package:test_delivery_app/utils/indicator.dart';
import 'package:test_delivery_app/widgets/button/login_btn.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();

    return Scaffold(
      backgroundColor: Palette.loginBg,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: config.sh(-10),
            right: config.sw(-70),
            child: SvgPicture.asset(
              "curves".svg,
              height: config.sh(185),
              width: config.sw(187),
            ),
          ),
          Positioned(
            top: config.sh(-100),
            left: config.sw(-278),
            child: Container(
              height: config.sh(556),
              width: config.sw(556),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.deepLoginBg
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: config.sw(36)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SvgPicture.asset(
                  "welcome_image".svg,
                  height: config.sh(195.5),
                  width: config.sw(304),
                ),
                SizedBox(height: config.sh(96)),
                Text(
                  "Welcome to E-Bikes",
                  style: CustomStyles.bold24.copyWith(
                    letterSpacing: 1.1
                  ),
                ),
                SizedBox(height: config.sh(8)),
                Text(
                  "Buying Electric bikes just got a lot easier,\nTry us today.",
                  textAlign: TextAlign.center,
                  style: CustomStyles.normal14,
                ),
                SizedBox(height: config.sh(24)),
                const DummyIndicator(itemCount: 3),
                SizedBox(height: config.sh(48)),
                const LoginButton(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have any account?",
                      style: CustomStyles.normal14,
                    ),
                    TextButton(
                      onPressed: () {}, 
                      child: Text(
                        "Sign Up",
                        style: CustomStyles.normal14.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Palette.black
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(height: config.sh(48))
              ],
            )
          )
        ],
      ),
    );
  }
}