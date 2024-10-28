part of '../view/new_student_page.dart';


class _InputGender extends StatelessWidget {
  const _InputGender();

  @override
  Widget build(BuildContext context) {
    List<GenderModel> list = [
      GenderModel(
        name: "Laki - Laki",
        value: "L"
      ),
      GenderModel(
        value: "P", 
        name: "Perempuan"
      )
    ];
    return DropdownButtonFormField2(
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
            'Jenis Kelamin',
            style: TextStyle(
              fontSize: fontSizeLarge,
              color: whiteColor
            ),
          ),
          items: list
          .map((item) => DropdownMenuItem<String>(
                value: item.value,
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: whiteColor
                  ),
                ),
              ))
          .toList(),
          validator: (value) {
            if (value == null) {
              return 'Masukkan jenis kelamin anda';
            }
            return null;
          },
          onChanged: (value) {
            context.read<NewStudentCubit>().copyToState(gender: value);
            debugPrint("Jenkel Input $value");
          },
          onSaved: (value) {
            context.read<NewStudentCubit>().copyToState(gender: value);
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
            overlayColor: MaterialStatePropertyAll(whiteColor),
            padding: EdgeInsets.symmetric(horizontal: 15),
          ),
        );
  }
}
