part of '../views/login_parent_page.dart';

class _InputFullname extends StatelessWidget {
  const _InputFullname();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginParentCubit, LoginPaarentState>(
      builder: (context, state) {
      return CustomTextField(
        labelText: 'Nama Lengkap',
        isEmail: true,
        onChanged: (p0) {
          var cubit = context.read<LoginParentCubit>();
          cubit.copyState(cubit.state.copyWith(fullname: p0));
        },
        hintText: "Nama Lengkap",
        fillColor: whiteColor.withOpacity(0.10),
        emptyText: "Nama Lengkap wajib di isi",
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      );
    });
  }
}