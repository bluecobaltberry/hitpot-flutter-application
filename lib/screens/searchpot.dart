import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitpot/services/api_potdata.dart';
import 'package:hitpot/widgets/btn/btn_add_pot.dart';
import 'package:hitpot/widgets/pot/pot.dart';
import 'package:hitpot/widgets/search/input_search.dart';

class SearchPot extends StatefulWidget {
  const SearchPot({super.key});

  @override
  State<SearchPot> createState() => _SearchPotState();
}

class _SearchPotState extends State<SearchPot> {
  late Future<List<dynamic>> futureItems;

  @override
  void initState() {
    super.initState();
    futureItems = getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //popmodal(const ModalIntro());
    });
    return Scaffold(
      //appBar: const AppbarLCR(centerText: '',),
      body: Padding(
        padding:
            EdgeInsets.only(left: 16.r, right: 16.r, top: 24.r, bottom: 40.r),
        child: Stack(
          children: <Widget>[
            ListView(
              children: [
                const Text(''),
                const InputSearch(double.infinity),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 343.w,
                  height: 1000,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: FutureBuilder<List<dynamic>>(
                    future: futureItems,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        final items = snapshot.data ?? [];
                        return ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = items[index];
                            return Pot(
                              projectType: item['ProjectType'],
                              potId: item['PotId'],
                              username: item['username'],
                              userage: item['userage'],
                              projectName: item['projectName'],
                              level: item['level'],
                              region: item['region'],
                              onoffline: item['onoffline'],
                              period: item['period'],
                              ageRange: item['ageRange'],
                              memNum: item['memNum'],
                              members: item['members'],
                              likeNum: item['likeNum'],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(height: 8),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 10,
              right: 10,
              child: BtnAddPot(),
            ),
          ],
        ),
      ),
    );
  }
}
