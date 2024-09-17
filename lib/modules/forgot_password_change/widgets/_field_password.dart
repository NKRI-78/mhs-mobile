part of '../view/forgot_password_change_page.dart';

// ignore: unused_element
class _FieldPassword extends StatelessWidget {
  const _FieldPassword();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordChangeCubit, ForgotPasswordChangeState>(builder: (context, state) {
      return CustomTextField(
        onChanged: (p0) {
          var cubit = context.read<ForgotPasswordChangeCubit>();
          cubit.copyState(newState: cubit.state.copyWith(password: p0));
        },
        labelText: "Kata Sandi Baru",
        isPassword: true,
        hintText: "",
        fillColor: whiteColor.withOpacity(0.10),
        emptyText: "Kata sandi baru tidak boleh kosong",
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );
    });
  }
}
