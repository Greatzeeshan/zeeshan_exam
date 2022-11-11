import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/image_helper.dart';

class TrendView extends StatefulWidget {
  const TrendView({Key? key}) : super(key: key);

  @override
  State<TrendView> createState() => _TrendViewState();
}

class _TrendViewState extends State<TrendView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        ImageHelper.soon,
      ),
    );
  }
}
