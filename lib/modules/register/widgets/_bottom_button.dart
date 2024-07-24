part of '../view/register_page.dart';

// ignore: unused_element
class _BottomButon extends StatelessWidget {
  const _BottomButon();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
              onPressed: state.loading
                  ? null
                  : () async {
                      try {
                        if (!(_formRegister.currentState?.validate() ??
                            false)) {
                          return;
                        }
                        var email =
                            await context.read<RegisterCubit>().submit();
                        if (!context.mounted) return;
                        RegisterOtpRoute(email: email).go(context);
                      } catch (e) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                      // RegisterOtpRoute(email: "example@example.com").go(context);
                    },
              child: const Text("Selanjutnya")),
        );
      },
    );
  }
}
