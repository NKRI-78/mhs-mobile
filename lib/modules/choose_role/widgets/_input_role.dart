part of '../view/choose_role_page.dart';


const List<String> _list = [
    'Siswa',
    'Orang Tua',
    'Alumni',
  ];
String? selectedValue;

class _SelectRoleWidgets extends StatelessWidget {
  const _SelectRoleWidgets();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseRoleCubit, ChooseRoleState>(
      builder: (context, st) {
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
              'Masuk Sebagai',
              style: TextStyle(
                fontSize: 14,
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
                ShowSnackbar.snackbar(context, "Pilih Role Anda", '', errorColor);
              }
              return null;
            },
            onChanged: (value) {
              var cubit = context.read<ChooseRoleCubit>();
              cubit.copyState(cubit.state.copyWith(roleSelect: value));
              // print('changing value to: $value');
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
              overlayColor: MaterialStatePropertyAll(whiteColor),
              padding: EdgeInsets.symmetric(horizontal: 15),
            ),
          );
      }
    );
  }
}
