part of '../view/forgot_password_change_page.dart';

class _ButtonSubmit extends StatelessWidget {
  const _ButtonSubmit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordChangeCubit, ForgotPasswordChangeState>(builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        height: 47,
        child: ElevatedButton(
          onPressed: state.loading
              ? null
              : () {
                  if (_formForgot.currentState?.validate() ?? false) {
                    context.read<ForgotPasswordChangeCubit>().submit(context);
                  }
                  if(context.mounted){
                    FocusScope.of(context).unfocus();
                  }
                },
          child: state.loading
              ? const CircularProgressIndicator.adaptive()
              : const Text(
                  'Submit',
                ),
        ),
      );
    });
  }
}
