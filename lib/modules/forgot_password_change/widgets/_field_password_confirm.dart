part of '../view/forgot_password_change_page.dart';

// ignore: unused_element
class _FieldPasswordConfirm extends StatelessWidget {
  const _FieldPasswordConfirm();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordChangeCubit, ForgotPasswordChangeState>(builder: (context, state) {
      return CustomTextField(
        onChanged: (p0) {
          var cubit = context.read<ForgotPasswordChangeCubit>();
          cubit.copyState(newState: cubit.state.copyWith(passwordConfirm: p0));
        },
        labelText: "Konfirmasi Password Baru",
        isPassword: true,
        hintText: "",
        fillColor: whiteColor.withOpacity(0.10),
        emptyText: "Konfirmasi password baru tidak boleh kosong",
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );
    });
  }
}
