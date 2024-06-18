import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllProcDoneVar {
  AllProcDoneVar({this.allProcDone = false, this.procNum = 0});

  final bool allProcDone; // 스크린 내 모든 할 일을 완료했는지 확인
  final int procNum;  // 스크린 내에서 처리해야 할 남은 Process number
}

class AllProcDoneVarProvider extends StateNotifier<AllProcDoneVar> {
  AllProcDoneVarProvider() : super(AllProcDoneVar());

  void setProcNum(int procNum) {
    state = AllProcDoneVar(
      procNum: procNum, // 스크린에서 받아온 처리해야할 Process number 받아오기
      //allProcDone: false, // procnum이 설정될 때마다 allprocdone 값을 false로 초기화
    );
  }

  void procNumDown() {
    state = AllProcDoneVar(
      procNum: state.procNum - 1, // Process 처리 시 하나씩 감소
    );
    /*
    if (state.procnum > 0) {
      state = AllProcDoneVar(
        procnum: state.procnum - 1, // Process 처리 시 하나씩 감소
        allprocdone: state.procnum - 1 == 0, // procnum이 0이 되면 allprocdone 값을 true로 설정
      );
    }
    */
  }

  void procNumUp() {
    state = AllProcDoneVar(
      procNum: state.procNum + 1, // Process 처리 취소 시 다시 복구
    );
  }
}

final allProcDoneProvider =
    StateNotifierProvider<AllProcDoneVarProvider, AllProcDoneVar>(
  (ref) {
    // 다른 형태: Provider<String>((ref) => '');
    return AllProcDoneVarProvider();
  },
);
