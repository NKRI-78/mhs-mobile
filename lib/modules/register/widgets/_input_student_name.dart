part of '../view/register_page.dart';

class _InputStudentName extends StatelessWidget {
  const _InputStudentName();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'Nama',
      onChanged: (value) {
        context.read<RegisterCubit>().setState(name: value);
      },
      isName: true,
      hintText: "Nama",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan nama anda",
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}
