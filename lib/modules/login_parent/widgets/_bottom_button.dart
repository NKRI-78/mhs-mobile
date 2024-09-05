part of '../views/login_parent_page.dart';

// ignore: unused_element
class _BottomButon extends StatelessWidget {
  const _BottomButon();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginParentCubit, LoginPaarentState>(builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        height: 47,
        child: ElevatedButton(
          onPressed: state.loading
              ? null
              : () {
                  if (_formLogin.currentState?.validate() ?? false) {
                    context.read<LoginParentCubit>().submit(context);
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