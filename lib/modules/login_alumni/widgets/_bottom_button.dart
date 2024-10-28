part of '../views/login_alumni_page.dart';

class _BottomButon extends StatelessWidget {
  const _BottomButon();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginAlumniCubit, LoginAlumniState>(builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        height: 47,
        child: ElevatedButton(
          onPressed: state.loading
              ? null
              : () {
                  if (_formLogin.currentState?.validate() ?? false) {
                    context.read<LoginAlumniCubit>().submit(context);
                  }
                  if(context.mounted){
                    FocusScope.of(context).unfocus();
                  }
                },
          child: state.loading
              ? const CircularProgressIndicator.adaptive()
              : const Text(
                  'Masuk',
                ),
        ),
      );
    });
  }
}