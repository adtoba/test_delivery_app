import 'package:flutter/material.dart';
import 'package:test_delivery_app/utils/dimensions.dart';


class CustomStyles {

  static SizeConfig config = SizeConfig();

  static TextStyle bold24 = TextStyle(
    fontSize: config.sp(24),
    fontWeight: FontWeight.w600,
    color: const Color(0xff041C2E)
  );

  static TextStyle bold18 = TextStyle(
    fontSize: config.sp(17),
    fontWeight: FontWeight.w700,
    color: const Color(0xff092C4C)
  );

  static TextStyle normal14 = TextStyle(
    fontSize: config.sp(14),
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: const Color(0xff96823D)
  );
}