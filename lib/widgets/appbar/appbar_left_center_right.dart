import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO: REFACTOR: True
class AppbarLCR extends StatelessWidget implements PreferredSizeWidget {
  const AppbarLCR({
    this.leftWidget,
    this.centerText,
    this.rightWidget,
    super.key,
  });
  // Appbar left, Center, Right 중에 택한 요소가 2개 이상일 경우
  final Widget? leftWidget;
  final String? centerText;
  final Widget? rightWidget;

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
              child: leftWidget ?? Container(),
            ),
          ),
          Expanded(
            flex: 2, // 차지하는 공간 2배 많게 해서 글자 안넘어가도록
            child: Align(
              child: Text(
                centerText!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.36,
                    ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: rightWidget ?? Container(),
            ),
          ),
        ],
      ),
    );
  }
}
