import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_delivery_app/style/palette.dart';
import 'package:test_delivery_app/style/textstyle.dart';
import 'package:test_delivery_app/utils/dimensions.dart';
import 'package:test_delivery_app/utils/extensions.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();

    return MaterialButton(
      height: config.sh(56),
      minWidth: double.infinity,
      child: Row(
        children: [
          Container(
            height: config.sh(32),
            width: config.sw(32),
            padding: const EdgeInsets.all(3),
            child: SvgPicture.asset(
              "google_icon".svg,
              height: config.sh(24),
              width: config.sw(24),
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
            ),
          ),
          const Spacer(),
          Text(
            "Login with Google",
            textAlign: TextAlign.center,
            style: CustomStyles.normal14.copyWith(
              color: Palette.white,
            ),
          ),
          const Spacer()
        ],
      ),
      color: Palette.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(52),
      ),
      onPressed: () {},
    );
  }
}