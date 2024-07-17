part of '../view/register_page.dart';

// ignore: unused_element
class _BottomButon extends StatelessWidget {
  const _BottomButon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          RegisterOtpRoute(email: "example@example.com").go(context);
        }, 
        child: const Text(
          "Selanjutnya"
        )
      ),
    );
  }
}