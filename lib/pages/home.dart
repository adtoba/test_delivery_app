import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:test_delivery_app/pages/track.dart';
import 'package:test_delivery_app/style/palette.dart';
import 'package:test_delivery_app/style/textstyle.dart';
import 'package:test_delivery_app/utils/dimensions.dart';
import 'package:test_delivery_app/utils/extensions.dart';
import 'package:test_delivery_app/utils/indicator.dart';
import 'package:test_delivery_app/widgets/button/theme_btn.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController mainPageController = PageController(
    keepPage: true,
    initialPage: 0
  );

  final PageController _pageController = PageController(
    viewportFraction: 0.8,
    keepPage: true,
    initialPage: 0
  );

  int activePage = 0;
  int activeMainPage = 0;

  void onMainPageChanged(int index) {
    setState(() => activeMainPage = index);
    mainPageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: config.sw(70),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: config.sw(10)),
          child: CircleAvatar(
            backgroundImage: Image.asset(
              "person".png,
              height: config.sh(30),
              width: config.sw(30),
            ).image,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: config.sw(20.0)),
            child: IconButton(
              icon: SvgPicture.asset("bell_icon".svg),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: PageView(
        controller: mainPageController,
        onPageChanged: onMainPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: config.sh(20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: config.sw(24)),
                child: Text(
                  "Hello good Morning!",
                  style: CustomStyles.bold18,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomCarouselWidget(
                    pageController: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        activePage = page;
                      });
                    },
                    images: [
                      "bike".png,
                      "bike".png,
                      "bike".png,
                      "bike".png
                    ],
                  ),
                ),
              ),
              SizedBox(height: config.sh(20)),
              Indicator(
                controller: _pageController,
                itemCount: 4,
              ),
              SizedBox(height: config.sh(30)),
              Container(
                height: config.sh(109),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: config.sw(32)),
                child: Row(
                  children: [
                    Text(
                      "Gotten your\nE-Bike yet?",
                      style: CustomStyles.normal14,
                    ),
                    SizedBox(width: config.sw(27),),
                    Expanded(
                      child: ThemeButton(
                        text: "Your Orders",
                        onTap: () => onMainPageChanged(1),
                      ),
                    )
                  ],
                ),
                decoration: const BoxDecoration(
                  color: Palette.loginBg,
                ),
              ),
              Container(
                height: config.sh(109),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.asset(
                      "assets/biker.json",
                      height: config.sh(160),
                      width: config.sw(161),
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.cover
                    ),
                    SizedBox(width: config.sw(20),),
                    Expanded(
                      child: Text(
                        "You too can join our\nElite squad of E-bikers",
                        style: CustomStyles.normal14.copyWith(
                          color: const Color(0xff424242)
                        ),
                      ),
                    ),
                    SizedBox(width: config.sw(20),),
                  ],
                ),
                decoration: const BoxDecoration(
                  color: Palette.white,
                ),
              ),
              SizedBox(height: config.sh(10)),
            ],
          ),
          const TrackPackagePage()
        ],
      ),
      bottomNavigationBar: Container(
        height: config.sh(90),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffF1F6FB)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => onMainPageChanged(0),
              child: SvgPicture.asset("home".svg)),
            SvgPicture.asset("bookmark".svg),
            SvgPicture.asset("send".svg),
            SvgPicture.asset("setting".svg),
          ],
        ),
      ),
    );
  }
}


class CustomCarouselWidget extends StatefulWidget {
  const CustomCarouselWidget({ Key? key, this.images, this.pageController, this.onPageChanged}) : super(key: key);

  final List<String>? images;
  final PageController? pageController;
  final Function(int)? onPageChanged;

  @override
  State<CustomCarouselWidget> createState() => _CustomCarouselWidgetState();
}

class _CustomCarouselWidgetState extends State<CustomCarouselWidget> {

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();

    return SizedBox(
      width: double.infinity,
      child: PageView(
        controller: widget.pageController,
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        onPageChanged: widget.onPageChanged,
        children: widget.images!.map((e) {
          return Container(
            height: config.sh(265),
            width: config.sw(200),
            margin: EdgeInsets.only(right: config.sw(20)),
            child: Image.asset(
              e
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF1F6FB),
              borderRadius: BorderRadius.circular(32),
            ),
          );
        }).toList()
      ),
    );
  }
}