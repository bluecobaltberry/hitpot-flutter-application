import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hitpot/screens/mainscreen.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class BtnLogin extends StatelessWidget {
  const BtnLogin(this.img, this.text, {super.key});
  final String img;
  final String text;
  //final LoginKakao loginKakao = LoginKakao();
  @override
  Widget build(BuildContext context) {
    void navigateToMainScreen() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    }

    Future<void> SignInWithKakao() async {
      if (await isKakaoTalkInstalled()) {
        try {
          await UserApi.instance.loginWithKakaoTalk().then((value) {
            print('카카오톡으로 로그인 성공 $value');
            navigateToMainScreen();
          });
        } catch (error) {
          print('카카오톡으로 로그인 실패 $error');

          // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
          // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
          if (error is PlatformException && error.code == 'CANCELED') {
            return;
          }

          // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
          try {
            await UserApi.instance.loginWithKakaoAccount().then((value) {
              print('카카오톡으로 로그인 성공 $value');
              navigateToMainScreen();
            });
          } catch (error) {
            print('카카오계정으로 로그인 실패 $error');
          }
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount().then((value) {
            print('카카오톡으로 로그인 성공 $value');
            navigateToMainScreen();
          });
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<Widget>(builder: (context) => const MainScreen()),
        );
      },
      //async {await SignInWithKakao();}, // 로그인 기능 호출,
      child: Container(
        width: 343.w,
        //height: 56.h,
        padding: EdgeInsets.symmetric(horizontal: 94.r, vertical: 17.r),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: const Color(0xFFE2E2E2)),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: SvgPicture.asset(img),
            ),
            SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyle(
                color: const Color(0xFF111111),
                fontSize: 15.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
