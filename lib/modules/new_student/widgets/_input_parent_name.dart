part of '../view/new_student_page.dart';

class _InputParentName extends StatelessWidget {
  const _InputParentName();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'Nama Orang Tua',
      onChanged: (value) {
        context.read<NewStudentCubit>().copyToState(parentName: value);
      },
      hintText: "Nama Orang Tua",
      isCapital: true,
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan nama orang tua anda",
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}
