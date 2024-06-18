import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitpot/screens/viewpot.dart';
import 'package:hitpot/widgets/btn/btn_like.dart';
import 'package:hitpot/widgets/chip/chip_data.dart';

class Pot extends StatelessWidget {
  const Pot({
    required this.projectType,
    required this.potId,
    required this.username,
    required this.userage,
    required this.projectName,
    required this.level,
    required this.region,
    required this.onoffline,
    required this.period,
    required this.ageRange,
    required this.memNum,
    required this.members,
    required this.likeNum,
    super.key,
  });

  final String projectType;
  final String potId;
  final String username;
  final int userage;
  final String projectName;
  final String level;
  final String region;
  final String onoffline;
  final String period;
  final String ageRange;
  final String memNum;
  final String members;
  final String likeNum;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewPot(
              projectType: projectType,
              potId: potId,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ChipData(projectType, 0xFFF5F5F7),
                    const SizedBox(
                      width: 4,
                    ),
                    ChipData(level, 0XFF019CE9),
                  ],
                ),
                Row(
                  children: [
                    ChipData(region, 0xFFF5F5F7),
                    const SizedBox(
                      width: 4,
                    ),
                    ChipData(period, 0xFFF5F5F7),
                  ],
                ),
                Row(
                  children: [
                    ChipData(onoffline, 0xFFF5F5F7),
                    const SizedBox(
                      width: 4,
                    ),
                    ChipData(ageRange, 0xFFF5F5F7),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const BtnLike(),
                Text(
                  likeNum,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                ChipData(memNum, 0xFFF5F5F7)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
