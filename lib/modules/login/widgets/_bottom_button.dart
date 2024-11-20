part of '../views/login_page.dart';

// ignore: unused_element
class _BottomButon extends StatelessWidget {
  const _BottomButon();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        height: 47,
        child: CustomButton(
          onTap: () {
            if (_formLogin.currentState?.validate() ?? false) {
              context.read<LoginCubit>().submit(context);
            }
            if(context.mounted){
              FocusScope.of(context).unfocus();
            }
          },
          isLoading: state.loading ? true : false,
          isBorder: false,
          isBorderRadius: true,
          isBoxShadow: false,
          btnTxt: "Masuk",
          loadingColor: primaryColor,
          btnColor: redColor,
          btnTextColor: whiteColor,
        ),
      );
    });
  }
}