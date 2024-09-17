part of '../view/new_student_page.dart';

const List<String> _list = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];
String? selectedValue;

class _InputClothesSize extends StatelessWidget {
  const _InputClothesSize();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: DropdownButtonFormField2(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          filled: true,
          fillColor: whiteColor.withOpacity(0.10),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        barrierColor: blackColor.withOpacity(0.4),
        hint: const Text(
          'Ukuran Baju',
          style: TextStyle(
            fontSize: fontSizeLarge,
            color: whiteColor
          ),
        ),
        items: _list
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  color: whiteColor
                ),
              ),
            ))
        .toList(),
        validator: (value) {
          if (value == null) {
            return 'Masukkan ukuran baju anda';
          }
          return null;
        },
        onChanged: (value) {
          context.read<NewStudentCubit>().copyToState(outfitSize: value);
        },
        onSaved: (value) {
          selectedValue = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: whiteColor,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: const DropdownStyleData(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 15),
        ),
      ),
    );
  }
}
