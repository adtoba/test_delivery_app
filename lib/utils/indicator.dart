import 'package:flutter/material.dart';
import 'package:test_delivery_app/style/palette.dart';
import 'package:test_delivery_app/utils/dimensions.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    @required this.controller,
    this.itemCount = 0,
    this.currentPage,
    this.size = 6.0,
  }) : super(key: key);

  final PageController? controller;
  final int itemCount;
  final int? currentPage;
  final double size;
  final double spacing = 10.0;

  Widget _buildIndicator(
    BuildContext context, 
    int index, 
    int pageCount, 
    double dotSize, 
    double spacing
  ) {
    
    final config = SizeConfig();
    final bool isCurrentPageSelected = index ==
        (controller!.page != null ? controller!.page!.round() % pageCount : 0);

    return SizedBox(
      height: config.sh(size),
      width: config.sw(size + (2 * spacing)),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: config.sw(isCurrentPageSelected ? 40 : dotSize),
            height: config.sh(dotSize),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              shape: BoxShape.circle,
              color: isCurrentPageSelected 
                ? Palette.black 
                : const Color(0xffE5F0FC)
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(context, index, itemCount, size, spacing);
      }),
    );
  }
}


class DummyIndicator extends StatelessWidget {
  const DummyIndicator({
    Key? key,
    this.itemCount = 0,
    this.currentPage,
    this.size = 6.0,
  }) : super(key: key);

  final int itemCount;
  final int? currentPage;
  final double size;
  final double spacing = 10.0;

  Widget _buildIndicator(
      BuildContext context, int index, int pageCount, double dotSize, double spacing) {
    
    final config = SizeConfig();

    return SizedBox(
      height: config.sh(size),
      width: config.sw(size + (2 * spacing)),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              shape: BoxShape.circle,
              color: index == 0 
                ? Palette.black 
                : Palette.white
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(context, index, itemCount, size, spacing);
      }),
    );
  }
}