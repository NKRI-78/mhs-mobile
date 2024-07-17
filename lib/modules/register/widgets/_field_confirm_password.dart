part of '../view/register_page.dart';

class _FieldConfirmPassword extends StatelessWidget {
  const _FieldConfirmPassword();

  @override
  Widget build(BuildContext context) {
      return CustomTextField(
        onChanged: (value) {},
        labelText: "Konfirmasi Kata Sandi",
        isPassword: true,
        hintText: "Konfirmasi Kata Sandi",
        fillColor: whiteColor.withOpacity(0.10),
        emptyText: "Konfirmasi Kata Sandi tidak boleh kosong",
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );
  }
}
