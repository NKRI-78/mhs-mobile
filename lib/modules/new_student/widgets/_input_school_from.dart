part of '../view/new_student_page.dart';

class _InputSchoolFrom extends StatelessWidget {
  const _InputSchoolFrom();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'Asal Sekolah',
      onChanged: (value) {
        context.read<NewStudentCubit>().copyToState(originSchool: value);
      },
      hintText: "",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan asal sekolah anda",
      textInputAction: TextInputAction.next,
    );
  }
}
