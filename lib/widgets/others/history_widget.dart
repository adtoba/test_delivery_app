import 'package:flutter/material.dart';
import 'package:test_delivery_app/style/textstyle.dart';
import 'package:test_delivery_app/utils/dimensions.dart';


class HistoryWidget extends StatelessWidget {
  const HistoryWidget({ Key? key, this.title, this.subtitle, this.trailing, this.leadingColor, this.leading }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? trailing;
  final Color? leadingColor;
  final String? leading;

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: config.sh(56),
        width: config.sw(56),
        alignment: Alignment.center,
        child: Text("$leading", style: TextStyle(fontSize: config.sp(30)),),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: leadingColor ?? const Color(0xffF1F6FB)
        ),
      ),
      title: Text(
        "$title",
        style: CustomStyles.normal14.copyWith(
          color: const Color(0xff1E3354),
          fontWeight: FontWeight.w600
        ),
      ),
      subtitle: Text(
        "$subtitle",
        style: CustomStyles.normal14.copyWith(
          color: const Color(0xff7A809D)
        ),
      ),
      trailing: Text(
        "$trailing",
        style: CustomStyles.normal14.copyWith(
          color: const Color(0xff7A809D)
        ),
      )
    );
  }
}