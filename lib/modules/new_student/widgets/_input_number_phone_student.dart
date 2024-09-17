part of '../view/new_student_page.dart';

class _InputNumberPhoneStudent extends StatelessWidget {
  const _InputNumberPhoneStudent();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'No HP Calon Siswa',
      onChanged: (value) {
        context.read<NewStudentCubit>().copyToState(phone: value);
      },
      isPhoneNumber: true,
      maxLength: 13,
      hintText: "No HP Calon Siswa",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan No hp calon siswa anda",
      textInputType: TextInputType.number,
      textInputAction: TextInputAction.next,
    );
  }
}
