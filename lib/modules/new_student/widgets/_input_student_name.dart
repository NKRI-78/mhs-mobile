part of '../view/new_student_page.dart';

class _InputStudentName extends StatelessWidget {
  const _InputStudentName();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewStudentCubit, NewStudentState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'Nama siswa',
          onChanged: (value) {
            context.read<NewStudentCubit>().copyToState(fullname: value);
          },
          hintText: "",
          fillColor: whiteColor.withOpacity(0.10),
          emptyText: "Masukan nama anda",
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
