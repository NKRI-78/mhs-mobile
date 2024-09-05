part of '../views/login_student_page.dart';

class _InputNis extends StatelessWidget {
  const _InputNis();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginStudentCubit, LoginStudentState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'NIS ( Nomor Induk Siswa )',
          onChanged: (value) {
            var cubit = context.read<LoginStudentCubit>();
            cubit.copyState(cubit.state.copyWith(nis: value));
          },
          hintText: "",
          fillColor: whiteColor.withOpacity(0.10),
          emptyText: "Masukan NIS anda",
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
        );
      }
    );
  }
}