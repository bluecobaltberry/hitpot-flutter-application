import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/*
 * TODO: 사용자가 클릭하지 않고 넘어가면 Overlay가 안꺼지고 다음 화면으로 넘어가게 되는데 
 * 1.화면을 넘기기 전에 무조건 제거하는 방식 구현(isDropdownOpen = false)
 * 2. overlay가 무조건 선택되고 다음 버튼이 생기도록 Btnnext에서 구현
 * 2번이 나아보임
 * TODO: 눌렸을 때 테두리 색상 변경 안됨
 * TODO: 버튼 눌렸을 때 색상 변화 애니메이션 효과
 */
class BtnDropDownCustom extends StatefulWidget {
  const BtnDropDownCustom({
    required this.dataType,
    required this.dropdownList,
    required this.onChanged, // 콜백 함수 추가
    super.key,
  });

  final String dataType;
  final List<String> dropdownList;
  final ValueChanged<String?> onChanged; // 콜백 함수 타입 추가

  @override
  State<BtnDropDownCustom> createState() => _BtnDropDownCustomState();
}

class _BtnDropDownCustomState extends State<BtnDropDownCustom> {
  String? selectedDropdown;
  bool isDropdownOpen = false;
  late OverlayEntry overlayEntry;

  void toggleDropdown() {
    if (isDropdownOpen) {
      overlayEntry.remove();
    } else {
      final renderBox = context.findRenderObject()! as RenderBox;
      final offset = renderBox.localToGlobal(Offset.zero);
      final size = renderBox.size;

      overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 8.h,
          width: size.width,
          child: Material(
            color: Colors.transparent, // 설정 해야 뒷 네모 박스 안 생김
            child: Container(
              // Inputfield 누르면 나오는 dropdownlist items 전체 container
              width: 343.w,
              height: 216.h,
              //padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: BorderSide(
                    width: 1.r,
                    color: const Color(0xFFDDDDDD),
                  ),
                ),
              ),
              child: ListView(
                children: widget.dropdownList.map((item) {
                  return InkWell(
                    //GestureDetector은 너무 밋밋한 느낌이어서 InkWell로 설정
                    onTap: () {
                      setState(() {
                        selectedDropdown = item;
                        isDropdownOpen = false;
                        overlayEntry.remove();
                      });
                      widget.onChanged(selectedDropdown); // 선택된 값 전달
                    },
                    child: Container(
                      // dropdownlist 각 item container
                      constraints: const BoxConstraints(
                        minWidth: double.infinity, // 최소 너비를 화면의 최대 너비로 설정
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.r,
                        vertical: 15.r,
                      ), // 여기 디자이너분께 값 정확한 건지 확인해봐야함
                      decoration: ShapeDecoration(
                        color: Colors
                            .white, //TODO: 눌렸을 때 색상 변화-const Color(0xFFF2F2F2)
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: const Color(
                                0xFF111111,
                              ),
                            ), // dropdownlist text의 색상
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(overlayEntry);
    }
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleDropdown,
      child: InputDecorator(
        // Inputfield
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white, // Inputfield 색상 e.g. 통신사가 써져있는 박스 색상
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            borderSide: BorderSide(width: 1.r, color: const Color(0xFFDDDDDD)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            borderSide: BorderSide(width: 1.r, color: const Color(0xFFDDDDDD)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            borderSide: BorderSide(
              width: 1.r,
              color: !isDropdownOpen
                  ? Theme.of(context).primaryColor
                  : const Color(0xFFDDDDDD),
            ), // 버튼이 눌린 상태에 따라 테두리 색을 변경
          ),
        ),
        child: Row(
          // Inputfield 내 text와 icon
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDropdown ?? widget.dataType,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: const Color(0xFF787878)),
            ), // Inputfield의 hinttext 및 스타일 e.g.통신사
            SvgPicture.asset('assets/ic/arrow-down.svg'),
          ],
        ),
      ),
    );
  }
}
