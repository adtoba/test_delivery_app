import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:test_delivery_app/style/palette.dart';
import 'package:test_delivery_app/style/textstyle.dart';
import 'package:test_delivery_app/utils/dimensions.dart';
import 'package:test_delivery_app/utils/extensions.dart';
import 'package:test_delivery_app/widgets/others/history_widget.dart';


class TrackingDetailPage extends StatefulWidget {
  const TrackingDetailPage({ Key? key }) : super(key: key);

  @override
  State<TrackingDetailPage> createState() => _TrackingDetailPageState();
}

class _TrackingDetailPageState extends State<TrackingDetailPage> {
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();

    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: MediaQuery.of(context).size.height / 1.2,
        minHeight: config.sh(130),
        backdropEnabled: true,
        body: Stack(
          children: [
            const MapWidget(),
            Positioned(
              top: config.sh(40),
              left: config.sw(24),
              right: config.sw(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        icon: const Icon(Icons.arrow_back_ios)
                      ),
                      const Spacer(),
                      Text(
                        "Tracking Details",
                        style: CustomStyles.bold18,
                      ),
                      const Spacer(),
                      SizedBox(width: config.sw(24),)
                    ],
                  ),
                  SizedBox(height: config.sh(40)),
                  Container(
                    height: config.sh(88),
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "SCP9374826473",
                        style: CustomStyles.normal14.copyWith(
                          color: const Color(0xff1E3354),
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(46),
                        border: Border.all(
                          color: Colors.black
                        )
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(46),
                      color: Palette.loginBg
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32)
        ),
        panelBuilder: (controller) {
          return ListView(
            controller: controller,
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: config.sw(24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        height: config.sh(6),
                        width: config.sw(60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffDBE2E9)
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Estimate arrives in",
                              style: CustomStyles.bold18.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: config.sp(14),
                                color: const Color(0xff7A809D)
                              ),
                            ),
                            SizedBox(height: config.sh(2)),
                            Text(
                              "2h 40m",
                              style: CustomStyles.bold24,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.more_horiz, color: Colors.black)
                      ],
                    ),
                    SizedBox(height: config.sh(30)),
                    const InfoWidget(),
                    SizedBox(height: config.sh(30)),
                    Text(
                      "History",
                      style: CustomStyles.bold18.copyWith(
                        fontSize: config.sp(16),
                        color: const Color(0xff2E3E5C)
                      ),
                    ),
                    SizedBox(height: config.sh(24)),
                    const HistoryWidget(
                      title: "In Delivery",
                      leading: "🚚",
                      subtitle: "Bali, Indonesia",
                      trailing: "00.00 PM",
                      leadingColor: Palette.loginBg,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: config.sw(25)),
                      child: Container(
                        height: config.sh(30),
                        width: 1,
                        color: const Color(0xffDFE6ED),
                      ),
                    ),
                    const HistoryWidget(
                      title: "Transit - Sending City",
                      leading: "📬",
                      subtitle: "Jakarta, Indonesia",
                      trailing: "21.00 PM",
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: config.sw(25)),
                      child: Container(
                        height: config.sh(30),
                        width: 1,
                        color: const Color(0xffDFE6ED),
                      ),
                    ),
                    const HistoryWidget(
                      title: "Send Form Sukabumi",
                      leading: "📦",
                      subtitle: "Sukabumi, Indonesia",
                      trailing: "19.00 PM",
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: config.sw(24), vertical: config.sh(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sukabumi, Indonesia",
            style: CustomStyles.normal14.copyWith(
              color: const Color(0xff1E3354),
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: config.sh(8)),
          Text(
            "No receipt : SCP6653728497",
            style: CustomStyles.normal14.copyWith(
              color: const Color(0xff7A809D)
            ),
          ),
          SizedBox(height: config.sh(16),),
          Divider(
            height: config.sh(1),
            color: const Color(0xffEDC127),
          ),
          SizedBox(height: config.sh(16)),
          Text(
            "2,50 USD",
            style: CustomStyles.normal14.copyWith(
              color: const Color(0xff1E3354),
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: config.sh(8)),
          Text(
            "Postal fee",
            style: CustomStyles.normal14.copyWith(
              color: const Color(0xff7A809D)
            ),
          ),
          SizedBox(height: config.sh(16),),
          Divider(
            height: config.sh(1),
            color: const Color(0xffEDC127),
          ),
          SizedBox(height: config.sh(16)),
          Text(
            "Bali, Indonesia",
            style: CustomStyles.normal14.copyWith(
              color: const Color(0xff1E3354),
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: config.sh(8)),
          Text(
            "Parcel, 24kg",
            style: CustomStyles.normal14.copyWith(
              color: const Color(0xff7A809D)
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Palette.loginBg
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SvgPicture.asset(
        "map".svg
      ),
    );
  }
}
