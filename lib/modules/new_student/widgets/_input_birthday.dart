part of '../view/new_student_page.dart';

class _InputBirthday extends StatelessWidget {
  const _InputBirthday();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'Tanggal Lahir',
      onChanged: (value) {},
      isName: true,
      hintText: "",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan tanggal lahir anda",
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}