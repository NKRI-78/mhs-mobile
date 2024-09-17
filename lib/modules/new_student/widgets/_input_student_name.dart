part of '../view/new_student_page.dart';

class _InputStudentName extends StatelessWidget {
  const _InputStudentName();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewStudentCubit, NewStudentState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'Nama Siswa',
          onChanged: (value) {
            context.read<NewStudentCubit>().copyToState(fullname: value);
          },
          isName: true,
          isCapital: true,
          hintText: "Nama Siswa",
          fillColor: whiteColor.withOpacity(0.10),
          emptyText: "Masukan nama anda",
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
