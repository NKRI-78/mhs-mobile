part of '../view/forgot_password_page.dart';

class _ButtonSubmit extends StatelessWidget {
  const _ButtonSubmit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        height: 47,
        child: ElevatedButton(
          onPressed: state.loading
              ? null
              : () {
                  if (_formForgot.currentState?.validate() ?? false) {
                    context.read<ForgotPasswordCubit>().submit(context);
                  }
                  if(context.mounted){
                    FocusScope.of(context).unfocus();
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
