part of '../views/login_page.dart';

class _InputFullname extends StatelessWidget {
  const _InputFullname();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return CustomTextField(
        labelText: 'Email/No. Telepon',
        isEmail: true,
        onChanged: (p0) {
          var cubit = context.read<LoginCubit>();
          cubit.copyState(cubit.state.copyWith(email: p0));
        },
        hintText: "Email/No. Telepon",
        fillColor: whiteColor.withOpacity(0.10),
        emptyText: "Email/No. Telepon wajib di isi",
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      );
    });
  }
}