import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitpot/providers/all_proc_done.dart';
import 'package:hitpot/widgets/appbar/appbar_left_center_right.dart';
import 'package:hitpot/widgets/btn/btn_back.dart';
import 'package:hitpot/widgets/btn/btn_next.dart';
import 'package:hitpot/widgets/input/btn_dropdown_custom.dart';

// TODO: REFACTOR: True
class AddPot extends ConsumerStatefulWidget {
  const AddPot({super.key});

  @override
  AddPotState createState() => AddPotState();
}

class AddPotState extends ConsumerState<AddPot> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(allProcDoneProvider.notifier).setProcNum(0); // 처리해야할 Procnum 설정
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarLCR(
        leftWidget: BtnBack(),
        centerText: '팟생성',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.r, right: 16.r, top: 28.r),
        child: ListView(
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    '프로젝트 종류',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(letterSpacing: -0.32),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '*필수',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(letterSpacing: -0.28),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const BtnDropDownCustom(
              dataType: 'ProjectType',
              dropdownList: ['Composing', 'Band', 'Ochestral'],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Flexible(
                  child: Text(
                    '실력',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(letterSpacing: -0.32),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '*필수',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(letterSpacing: -0.28),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const BtnDropDownCustom(
              dataType: 'level',
              dropdownList: [
                'Master',
                'Expert',
                'Pro',
                'Semi-pro',
                'Amateur',
                'Advanced',
                'Intermediate',
                'Beginner',
                'Novice'
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Flexible(
                  child: Text(
                    '지역',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(letterSpacing: -0.32),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '*필수',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(letterSpacing: -0.28),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const BtnDropDownCustom(
              dataType: 'region',
              dropdownList: [
                '서울',
                '부산',
                '대구',
                '인천',
                '광주',
                '대전',
                '울산',
                '세종',
                '경기도',
                '강원도',
                '충청북도',
                '충청남도',
                '전라북도',
                '전라남도',
                '경상북도',
                '경상남도',
                '제주도'
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Flexible(
                  child: Text(
                    '온라인/오프라인',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(letterSpacing: -0.32),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '*필수',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(letterSpacing: -0.28),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const BtnDropDownCustom(
              dataType: 'onoffline',
              dropdownList: [
                '대면',
                '비대면',
                '복합',
                '상관없음',
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Flexible(
                  child: Text(
                    '기간',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(letterSpacing: -0.32),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '*필수',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(letterSpacing: -0.28),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const BtnDropDownCustom(
              dataType: 'period',
              dropdownList: [
                '상관없음',
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: 96.h,
          child: const BtnNext('생성하기'),
        ),
      ),
    );
  }
}
