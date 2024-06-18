import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnBack extends StatelessWidget {
  const BtnBack({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 32.w,
        height: 32.h,
        padding: EdgeInsets.only(
          top: 4.r,
          bottom: 4.r,
          left: 12.r,
        ),
        child: SvgPicture.asset('assets/ic/close.svg'),
      ),
    );
  }
}
