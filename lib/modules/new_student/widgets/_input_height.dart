part of '../view/new_student_page.dart';

class _InputHeight extends StatelessWidget {
  const _InputHeight();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: CustomTextField(
        labelText: 'Tinggi Badan',
        onChanged: (value) {
          context.read<NewStudentCubit>().copyToState(height: value);
        },
        isPhoneNumber: true,
        hintText: "",
        fillColor: whiteColor.withOpacity(0.10),
        emptyText: "Masukan tinggi badan anda",
        textInputType: TextInputType.number,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
