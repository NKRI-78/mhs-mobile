part of '../view/register_page.dart';

class _FieldPassword extends StatelessWidget {
  const _FieldPassword();

  @override
  Widget build(BuildContext context) {
      return CustomTextField(
        onChanged: (value) {},
        labelText: "Kata Sandi",
        isPassword: true,
        hintText: "Kata Sandi",
        fillColor: whiteColor.withOpacity(0.10),
        emptyText: "Kata Sandi tidak boleh kosong",
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );
  }
}
