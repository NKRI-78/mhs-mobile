part of '../view/register_page.dart';

class _InputEmail extends StatelessWidget {
  const _InputEmail();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'E-mail',
      onChanged: (value) {

      },
      isName: true,
      hintText: "Email",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan email anda",
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}