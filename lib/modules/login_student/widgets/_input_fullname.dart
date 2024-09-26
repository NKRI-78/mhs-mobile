part of '../views/login_student_page.dart';

class _InputFullname extends StatelessWidget {
  const _InputFullname();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginStudentCubit, LoginStudentState>(
      builder: (context, state) {
      return CustomTextField(
        labelText: 'Nama Lengkap',
        isEmail: true,
        onChanged: (p0) {
          var cubit = context.read<LoginStudentCubit>();
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