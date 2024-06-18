import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitpot/providers/all_proc_done.dart';

//TODO: REFACTOR: True
class BtnCreate extends ConsumerWidget {
  const BtnCreate(this.text, {required this.onPressed, super.key});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isEnabled = ref.watch(allProcDoneProvider).procNum == 0;

    return GestureDetector(
      onTap: isEnabled ? onPressed : null, // 클릭 가능 여부에 따라 onPressed 호출
      child: Container(
        width: double.infinity,
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.5),
        decoration: ShapeDecoration(
          color: isEnabled
              ? Theme.of(context).primaryColor
              : const Color(0xFF444444),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.36.sp,
          ),
        ),
      ),
    );
  }
}
