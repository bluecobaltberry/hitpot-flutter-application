import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipData extends StatelessWidget {
  const ChipData(this.text, this.color, {super.key});
  final String text;
  final int color;
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 100.w,
      //height: 28.h,
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 4.r),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.r),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0XFF000000),
          fontSize: 14.sp,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w500,
          //height: 0.10,
          //letterSpacing: -0.28,
        ),
      ),
    );
  }
}
