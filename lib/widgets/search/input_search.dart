import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * TODO:
 * input bottom margin 자동으로 생기는 것 제어 -> contentpadding??? 
 */

class InputSearchVar {
  InputSearchVar({
    this.isClicked = false,
    this.isTyped = false,
  });
  // 공용 변수 선언
  final bool isClicked;
  final bool isTyped;
}

class InputSearchProvider extends StateNotifier<InputSearchVar> {
  // Provider 선언, 즉, 징검다리 설계
  InputSearchProvider() : super(InputSearchVar());

  void updateState(String inputText) {
    state = InputSearchVar(
      isClicked: inputText.isEmpty, // input을 누르긴 했지만 빈 상태인가
      isTyped: inputText.isNotEmpty, // input을 누르고 typing까지 했는가
    );
  }
}

final inputSearchProvider =
    StateNotifierProvider<InputSearchProvider, InputSearchVar>((ref) {
  // 다른 형태: Provider<String>((ref) => '');
  return InputSearchProvider();
});

class InputSearch extends StatefulWidget {
  const InputSearch(
    this.inputWidth, {
    this.inputHint,
    this.inputStyle,
    super.key,
  });
  final double inputWidth;
  final String? inputHint;
  final TextStyle? inputStyle;

  @override
  State<InputSearch> createState() => _InputSearchstate();
}

class _InputSearchstate extends State<InputSearch> {
  String inputValue = '';

  @override
  Widget build(BuildContext context) {
    return Consumer(
      // Provider사용시
      builder: (context, ref, _) {
        return SizedBox(
          width: widget.inputWidth,
          height: 36.h,
          child: TextFormField(
            onChanged: (text) {
              setState(() {
                inputValue = text; // input내의 text바꾸도록
                ref.read(inputSearchProvider.notifier).updateState(text);
                //widget.isClicked = text.isEmpty; // input을 누르긴 했지만 빈 상태인가
                //widget.isTyped = text.isNotEmpty; // input을 누르고 typing까지 했는가
              });
            },
            showCursor: false,
            textAlignVertical: TextAlignVertical.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(0xFF232323),
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.32,
                ),
            decoration: InputDecoration(
              hintText: widget.inputHint,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color(0xFF787878),
                  ), //widget.inputStyle,
              filled: true,
              fillColor: Colors.white,
              /*contentPadding: EdgeInsets.all(16.r),*/
              labelStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                borderSide: BorderSide(
                  width: 1.r,
                  color: const Color(0xFFDDDDDD),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                borderSide: BorderSide(
                  width: 1.r,
                  color: const Color(0xFFDDDDDD),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                borderSide: BorderSide(
                  width: 1.r,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
