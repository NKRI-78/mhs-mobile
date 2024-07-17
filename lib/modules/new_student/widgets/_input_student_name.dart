part of '../view/new_student_page.dart';

class _InputStudentName extends StatelessWidget {
  const _InputStudentName();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'Nama siswa',
      onChanged: (value) {},
      isName: true,
      hintText: "",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan nama anda",
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}