import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: REFACTOR: True
// TODO: 반응형시 왼쪽에 딱 붙지 않음
class AppbarL extends StatelessWidget implements PreferredSizeWidget {
  // Appbar left에 요소 1개 있을 경우
  const AppbarL({
    required this.leftWidget,
    super.key,
  });
  final Widget leftWidget;

  // preferredSize 설정 // Appbar높이
  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: leftWidget,
            ),
          ),
          //Expanded(child: Container()),
          //Expanded(child: Container()),
        ],
      ),
    );
  }
}
