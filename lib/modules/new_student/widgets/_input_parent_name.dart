part of '../view/new_student_page.dart';

class _InputParentName extends StatelessWidget {
  const _InputParentName();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'Nama orang tua',
      onChanged: (value) {},
      isName: true,
      hintText: "",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan nama orang tua anda",
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}