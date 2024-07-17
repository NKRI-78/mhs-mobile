part of '../view/new_student_page.dart';

class _InputNumberPhoneStudent extends StatelessWidget {
  const _InputNumberPhoneStudent();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'No HP Calon Siswa',
      onChanged: (value) {},
      isName: true,
      hintText: "",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan No hp calon siswa anda",
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}