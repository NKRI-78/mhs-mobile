part of '../views/login_page.dart';

class _FieldPassword extends StatelessWidget {
  const _FieldPassword();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return CustomTextField(
        onChanged: (p0) {
          var cubit = context.read<LoginCubit>();
          cubit.copyState(cubit.state.copyWith(password: p0));
        },
        labelText: "Kata Sandi",
        isPassword: true,
        hintText: "",
        // emptyText: "",
        fillColor: whiteColor.withOpacity(0.10),
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );
    });
  }
}
