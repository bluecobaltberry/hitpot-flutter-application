import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitpot/providers/all_proc_done.dart';
import 'package:hitpot/services/api_potdata.dart'; // API 호출을 위한 import 추가
import 'package:hitpot/widgets/appbar/appbar_left_center_right.dart';
import 'package:hitpot/widgets/btn/btn_back.dart';
import 'package:hitpot/widgets/btn/btn_create.dart';
import 'package:hitpot/widgets/input/btn_dropdown_custom.dart';
import 'package:uuid/uuid.dart';

class AddPot extends ConsumerStatefulWidget {
  const AddPot({super.key});

  @override
  AddPotState createState() => AddPotState();
}

class AddPotState extends ConsumerState<AddPot> {
  String? selectedProjectType;
  String? selectedLevel;
  String? selectedRegion;
  String? selectedOnOffline;
  String? selectedPeriod;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(allProcDoneProvider.notifier).setProcNum(0); // 처리해야할 Procnum 설정
    });
  }

  @override
  Widget build(BuildContext context) {
    void createPot() async {
      if (selectedProjectType != null &&
          selectedLevel != null &&
          selectedRegion != null &&
          selectedOnOffline != null &&
          selectedPeriod != null) {
        // 필요한 데이터를 모두 수집했을 때 API 호출
        var uuid = const Uuid();
        var potId = uuid.v4();

        await addItem(
          projectType: selectedProjectType!,
          potId: potId, // 임의의 potId 사용, 고유 ID를 생성필요.
          username: 'testUser',
          userage: 24,
          projectName: 'testProject',
          level: selectedLevel!,
          region: selectedRegion!,
          onoffline: selectedOnOffline!,
          period: selectedPeriod!,
          ageRange: '20-30',
          memNum: '1/5',
          members: 'member1, member2',
          likeNum: '10',
        );
        Navigator.pop(context);
      } else {
        // 필요한 데이터가 선택되지 않은 경우 경고 메시지 출력
        print('모든 필수 항목을 선택해주세요.');
      }
    }

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
            BtnDropDownCustom(
              dataType: 'ProjectType',
              dropdownList: const ['Composing', 'Band', 'Ochestral'],
              onChanged: (value) {
                setState(() {
                  selectedProjectType = value;
                });
              },
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
            BtnDropDownCustom(
              dataType: 'level',
              dropdownList: const [
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
              onChanged: (value) {
                setState(() {
                  selectedLevel = value;
                });
              },
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
            BtnDropDownCustom(
              dataType: 'region',
              dropdownList: const [
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
              onChanged: (value) {
                setState(() {
                  selectedRegion = value;
                });
              },
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
            BtnDropDownCustom(
              dataType: 'onoffline',
              dropdownList: const [
                '대면',
                '비대면',
                '복합',
                '상관없음',
              ],
              onChanged: (value) {
                setState(() {
                  selectedOnOffline = value;
                });
              },
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
            BtnDropDownCustom(
              dataType: 'period',
              dropdownList: const [
                '상관없음',
              ],
              onChanged: (value) {
                setState(() {
                  selectedPeriod = value;
                });
              },
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
          child: BtnCreate(
            '생성하기',
            onPressed: createPot, // 생성하기 버튼 클릭 시 API 호출
          ),
        ),
      ),
    );
  }
}
