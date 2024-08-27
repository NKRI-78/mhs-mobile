part of '../views/login_page.dart';

class _FieldPassword extends StatelessWidget {
  const _FieldPassword();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChanged: (p0) {},
      labelText: "Kata Sandi",
      isPassword: true,
      hintText: "",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Kata sandi tidak boleh kosong",
      textInputType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }
}
