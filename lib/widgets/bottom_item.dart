
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeeshan_exam/utils/color_helper.dart';

class BottomItem extends StatelessWidget {
  final String iconLink;
  final String text;
  final Function() onTap;
  final bool isSelected;
  final Color imgColor;

  const BottomItem({
    required this.iconLink,
    required this.text,
    this.imgColor = Colors.black,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconLink,
            color: isSelected ? ColorHelper.black : ColorHelper.grey,
            height: 23,
            width: 23,
            fit: BoxFit.fill,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? ColorHelper.black : ColorHelper.grey,
            ),
          ),
        ],
      ),
    );
  }
}