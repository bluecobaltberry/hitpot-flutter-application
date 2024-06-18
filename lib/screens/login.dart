import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hitpot/widgets/btn/btn_login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

// TODO: REFACTOR: True
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 110.h),
          SizedBox(
            width: 200.w,
            height: 200.h,
            child: SvgPicture.asset(
              'assets/img/logo-login.svg',
            ),
          ),
          SizedBox(height: 58.h),
          SizedBox(
            width: 189.w,
            height: 70.h,
            child: SvgPicture.asset(
              'assets/img/textbox-login.svg',
            ),
          ),
          SizedBox(height: 8.h),
          const BtnLogin('assets/img/logo-kakao.svg', '카카오로 계속하기'),
          SizedBox(
            height: 8.h,
          ),
          const BtnLogin('assets/img/logo-naver.svg', 'Google로 계속하기'),
          SizedBox(
            height: 8.h,
          ),
          const BtnLogin('assets/img/logo-apple.svg', 'Apple로 계속하기'),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
