import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_delivery_app/style/palette.dart';
import 'package:test_delivery_app/style/textstyle.dart';
import 'package:test_delivery_app/utils/dimensions.dart';
import 'package:test_delivery_app/utils/extensions.dart';


class ThemeButton extends StatelessWidget {
  const ThemeButton({ Key? key, this.text, this.onTap }) : super(key: key);

  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();

    return MaterialButton(
      height: config.sh(56),
      minWidth: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: config.sw(28)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$text",
              textAlign: TextAlign.center,
              style: CustomStyles.normal14.copyWith(
                color: Palette.white,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              "arrow_forward".svg
            )
          ],
        ),
      ),
      color: Palette.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(52),
      ),
      onPressed: onTap
    );
  }
}