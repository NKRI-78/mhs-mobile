part of '../view/choose_role_page.dart';


const List<String> _list = [
    'Siswa',
    'Parent',
    'Alumni',
  ];
SingleSelectController selectController = SingleSelectController(_list);

class _SelectRoleWidgets extends StatelessWidget {
  const _SelectRoleWidgets();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseRoleCubit, ChooseRoleState>(
      builder: (context, st) {
        return SizedBox(
          height: 100,
          child:  CustomDropdown(
            decoration: CustomDropdownDecoration(
              expandedFillColor:  whiteColor,
              closedFillColor: whiteColor,
              closedBorder: Border.all(width: 1, color: whiteColor),
              expandedBorder: Border.all(width: 1, color: whiteColor),
              listItemStyle: const TextStyle(
                color: blackColor
              ),
              headerStyle: const TextStyle(
                color: blackColor
              ),
              expandedSuffixIcon: const Icon(Icons.keyboard_arrow_up_sharp, color: blackColor,),
              closedSuffixIcon: const Icon(Icons.keyboard_arrow_down_sharp, color: blackColor,),
            ),
            // controller: selectController,
            // excludeSelected: false,
            // hideSelectedFieldWhenExpanded: false,
            hintText: 'Select Role',
            items: _list,
            initialItem: _list[0],
            onChanged: (value) {
              var cubit = context.read<ChooseRoleCubit>();
              cubit.copyState(cubit.state.copyWith(roleSelect: value));
              print('changing value to: $value');
            },
          ),
        );
      }
    );
  }
}
