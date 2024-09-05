part of '../views/login_parent_page.dart';

// ignore: unused_element
class _InputStudent extends StatelessWidget {
  const _InputStudent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginParentCubit, LoginPaarentState>(
      builder: (context, state) {
      return CustomTextField(
        labelText: 'Nama Siswa',
        isEmail: true,
        onChanged: (p0) {
          var cubit = context.read<LoginParentCubit>();
          cubit.copyState(cubit.state.copyWith(student: p0));
        },
        hintText: "",
        fillColor: whiteColor.withOpacity(0.10),
        emptyText: "Nama Siswa wajib di isi",
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      );
    });
  }
}