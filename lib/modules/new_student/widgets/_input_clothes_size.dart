part of '../view/new_student_page.dart';

const List<String> _list = [
    'Ukuran Baju',
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];
const List<String> initList = [
    'Ukuran Baju',
  ];

class _InputClothesSize extends StatelessWidget {
  const _InputClothesSize();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: CustomDropdown(
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
      hideSelectedFieldWhenExpanded: true,
      items: _list,
      hintText: "Ukuran",
      initialItem: _list[0],
      onChanged: (value) {
        context.read<NewStudentCubit>().copyToState(outfitSize: value);
      },
    ),
    );
  }
}
