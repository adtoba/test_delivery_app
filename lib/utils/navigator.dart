import 'package:flutter/material.dart';
import 'package:test_delivery_app/main.dart';

push(Widget page) {
  navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) {
    return page;
  }));
}