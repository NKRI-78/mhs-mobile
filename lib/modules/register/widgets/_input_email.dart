part of '../view/register_page.dart';

class _InputEmail extends StatelessWidget {
  const _InputEmail();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'E-mail',
      onChanged: (value) {
        context.read<RegisterCubit>().setState(email: value);
      },
      isEmail: true,
      hintText: "Email",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan email anda",
      textInputType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}
