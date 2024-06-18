import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnLike extends StatefulWidget {
  const BtnLike({super.key});

  @override
  State<BtnLike> createState() => _BtnLikeState();
}

class _BtnLikeState extends State<BtnLike> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: !_isChecked
          ? SizedBox(
              width: 20, // Width of the button
              height: 20, // Height of the button
              child: SvgPicture.asset(
                'assets/ic/heart-add-white.svg',
              ),
            )
          : SizedBox(
              width: 20, // Width of the button
              height: 20, // Height of the button
              child: SvgPicture.asset(
                'assets/ic/heart-add-red.svg',
              ),
            ),
    );
  }
}
