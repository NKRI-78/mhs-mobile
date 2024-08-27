part of '../views/login_page.dart';

class _InputFullname extends StatelessWidget {
  const _InputFullname();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'Full Name',
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