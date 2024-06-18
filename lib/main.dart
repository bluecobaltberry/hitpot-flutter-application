import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitpot/constants/themedata.dart';
import 'package:hitpot/screens/mainscreen.dart';
import 'package:hitpot/screens/splash.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '794815350345d2fd0ebf95c31db5883d',
    javaScriptAppKey: 'd8e6da390952b8e138dbf5f9595c36a8',
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // screenutil 적용
      designSize: const Size(375, 812), // 피그마에 디자인된 앱 프레임 사이즈로 맞춰서 적용하면 됨
      minTextAdapt: true, // 텍스트 크기를 자동으로 조정하여 화면에 맞추는 기능을 활성화
      splitScreenMode: true, // 분할 화면 모드를 활성화
      builder: (context, child) {
        return MaterialApp(
          title: 'HITPOT',
          //theme: initThemeData(brightness: Brightness.dark),
          theme: darkmode,
          darkTheme: lightmode,
          home: const Splash(),
        );
      },
    );
  }
}
