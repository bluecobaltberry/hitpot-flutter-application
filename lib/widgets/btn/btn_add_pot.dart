import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hitpot/screens/addpot.dart';

class BtnAddPot extends StatelessWidget {
  const BtnAddPot({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<Widget>(builder: (context) => const AddPot()),
        );
      },
      child: Container(
        width: 36, // Width of the button
        height: 36, // Height of the button
        decoration: const BoxDecoration(
          color: Colors.white, // Button color
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset('assets/ic/add-circle-outline.svg'),
      ),
    );
  }
}
