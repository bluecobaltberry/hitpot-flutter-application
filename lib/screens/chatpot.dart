import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitpot/widgets/appbar/appbar_left_center_right.dart';

class ChatPot extends StatelessWidget {
  const ChatPot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarLCR(
        centerText: 'Chat Pot',
      ),
      body: Container(
        padding:
            EdgeInsets.only(left: 16.r, right: 16.r, top: 24.r, bottom: 40.r),
        child: ListView(
          children: [
            SizedBox(
              //width: 343.w,
              child: Text(
                '채팅 구현중',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
