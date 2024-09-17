part of '../view/forgot_password_otp_page.dart';

// ignore: unused_element
class _ButtonSubmit extends StatelessWidget {
  const _ButtonSubmit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordOtpCubit, ForgotPasswordOtpState>(builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        height: 47,
        child: ElevatedButton(
          onPressed: state.loading
              ? null
              : () {
                  if (_formForgot.currentState?.validate() ?? false) {
                    context.read<ForgotPasswordOtpCubit>().submit(context, state.otp);
                  }
                },
          child: state.loading
              ? const CircularProgressIndicator.adaptive()
              : const Text(
                  'Kirim Permintaan',
                ),
        ),
      );
    });
  }
}
