import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_delivery_app/pages/tracking_detail.dart';
import 'package:test_delivery_app/style/palette.dart';
import 'package:test_delivery_app/style/textstyle.dart';
import 'package:test_delivery_app/utils/dimensions.dart';
import 'package:test_delivery_app/utils/extensions.dart';
import 'package:test_delivery_app/utils/navigator.dart';
import 'package:test_delivery_app/widgets/button/theme_btn.dart';

class TrackPackagePage extends StatefulWidget {
  const TrackPackagePage({ Key? key }) : super(key: key);

  @override
  State<TrackPackagePage> createState() => _TrackPackagePageState();
}

class _TrackPackagePageState extends State<TrackPackagePage> {
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();

    return Scaffold(
      backgroundColor: Palette.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: config.sw(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: config.sh(20)),
            Text(
              "Hello good Morning!",
              style: CustomStyles.bold18.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: config.sh(300),
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: config.sh(-30),
                    right: config.sw(-100),
                    child: SvgPicture.asset(
                      "curves".svg,
                      height: config.sh(185),
                      width: config.sw(187),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: config.sw(24), vertical: config.sh(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: config.sh(20)),
                        Text(
                          "Track Your Package",
                          style: CustomStyles.bold18.copyWith(
                            color: const Color(0xff031725)
                          )
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Enter the receipt number that has been given by the officer",
                          style: CustomStyles.normal14,
                        ),
                        const Spacer(),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter the receipt number",
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xff031420),
                                width: 0.5
                              ),
                              borderRadius: BorderRadius.circular(28)
                            )
                          ),
                        ),
                        const SizedBox(height: 10),
                        ThemeButton(
                          text: "Track Now",
                          onTap: () {
                            push(const TrackingDetailPage());
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Palette.loginBg
              ),
            ),
            SizedBox(height: config.sh(30)),
            Text(
              "Tracking history",
              style: CustomStyles.bold18.copyWith(
                fontSize: config.sp(16),
                color: const Color(0xff2E3E5C)
              ),
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: config.sh(16)),
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: config.sh(56),
                    width: config.sw(56),
                    alignment: Alignment.center,
                    child: Text("📦", style: TextStyle(fontSize: config.sp(30)),),
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF1F6FB)
                    ),
                  ),
                  title: Text(
                    "SCP9374826473",
                    style: CustomStyles.normal14.copyWith(
                      color: const Color(0xff1E3354),
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text(
                    "In the process",
                    style: CustomStyles.normal14.copyWith(
                      color: const Color(0xff7A809D)
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {}, 
                    icon: const Icon(Icons.arrow_forward_ios, color: Color(0xff1E3354))
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: config.sh(56),
                    width: config.sw(56),
                    alignment: Alignment.center,
                    child: Text("📦", style: TextStyle(fontSize: config.sp(30)),),
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF1F6FB)
                    ),
                  ),
                  title: Text(
                    "SCP6653728497",
                    style: CustomStyles.normal14.copyWith(
                      color: const Color(0xff1E3354),
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text(
                    "In the process",
                    style: CustomStyles.normal14.copyWith(
                      color: const Color(0xff7A809D)
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {}, 
                    icon: const Icon(Icons.arrow_forward_ios, color: Color(0xff1E3354))
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}