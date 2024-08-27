part of '../view/choose_role_page.dart';

const List<String> _list = [
    'Student',
    'Parent',
    'Alumn',
  ];

class _SelectRoleWidgets extends StatelessWidget {
  const _SelectRoleWidgets();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child:  CustomDropdown(
        decoration: CustomDropdownDecoration(
          expandedFillColor:  whiteColor,
          closedFillColor: whiteColor.withOpacity(0.10),
          closedBorder: Border.all(width: 1, color: whiteColor),
          expandedBorder: Border.all(width: 1, color: whiteColor),
          listItemStyle: const TextStyle(
            color: blackColor
          ),
          headerStyle: const TextStyle(
            color: whiteColor
          ),
          expandedSuffixIcon: const Icon(Icons.keyboard_arrow_up_sharp, color: blackColor,),
          closedSuffixIcon: const Icon(Icons.keyboard_arrow_down_sharp, color: whiteColor,),
        ),
        excludeSelected: false,
        hideSelectedFieldWhenExpanded: false,
        hintText: 'Select Role',
        items: _list,
        initialItem: _list[0],
        onChanged: (value) {
          print('changing value to: $value');
        },
      ),
    );
  }
}
