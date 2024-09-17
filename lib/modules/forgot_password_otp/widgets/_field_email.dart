part of '../view/forgot_password_otp_page.dart';

// ignore: unused_element
class _FieldEmail extends StatelessWidget {
  const _FieldEmail();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordOtpCubit, ForgotPasswordOtpState>(builder: (context, state) {
      return CustomTextField(
        labelText: 'Email/No. Telepon',
        isEmail: true,
        onChanged: (p0) {
          var cubit = context.read<ForgotPasswordOtpCubit>();
          cubit.copyState(newState: cubit.state.copyWith(email: p0));
        },
        hintText: "",
        emptyText: "Email/No. Telepon wajib di isi",
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      );
    });
  }
}
