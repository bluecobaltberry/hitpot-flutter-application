import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitpot/services/api_potdata.dart';
import 'package:hitpot/widgets/appbar/appbar_left_center_right.dart';
import 'package:hitpot/widgets/btn/btn_apply.dart';
import 'package:hitpot/widgets/btn/btn_back.dart';
import 'package:hitpot/widgets/chip/chip_data.dart';

class ViewPot extends StatefulWidget {
  final String projectType;
  final String potId;

  const ViewPot({
    required this.projectType,
    required this.potId,
    super.key,
  });

  @override
  State<ViewPot> createState() => _ViewPotState();
}

class _ViewPotState extends State<ViewPot> {
  late Future<Map<String, dynamic>> futureItem;

  @override
  void initState() {
    super.initState();
    futureItem = getItem(projectType: widget.projectType, potId: widget.potId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarLCR(
        leftWidget: BtnBack(),
        centerText: '팟',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.r, right: 16.r, top: 28.r),
        child: FutureBuilder<Map<String, dynamic>>(
          future: futureItem,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              final item = snapshot.data!;
              print(item);
              return ListView(
                children: [
                  Text(
                    '프로젝트 종류',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(letterSpacing: -0.32),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 8),
                  ChipData(item['ProjectType'], 0xFFF5F5F7),
                  const SizedBox(height: 24),
                  Text(
                    '실력',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(letterSpacing: -0.32),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 8),
                  ChipData(item['level'], 0xFF019CE9),
                  const SizedBox(height: 24),
                  Text(
                    '지역',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(letterSpacing: -0.32),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 8),
                  ChipData(item['region'], 0xFFF5F5F7),
                  const SizedBox(height: 24),
                  Text(
                    '온라인/오프라인',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(letterSpacing: -0.32),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 8),
                  ChipData(item['onoffline'], 0xFFF5F5F7),
                  const SizedBox(height: 24),
                  Text(
                    '기간',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(letterSpacing: -0.32),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 8),
                  ChipData(item['period'], 0xFFF5F5F7),
                  const SizedBox(height: 24),
                ],
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: 96.h,
          child: const BtnApply('참여하기'),
        ),
      ),
    );
  }
}
