part of '../view/new_student_page.dart';

class _InputNumberPhoneParent extends StatelessWidget {
  const _InputNumberPhoneParent();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'No HP Calon Orang Tua',
      onChanged: (value) {},
      isName: true,
      hintText: "",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan No hp calon orang tua anda",
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}