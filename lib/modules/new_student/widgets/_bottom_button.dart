part of '../view/new_student_page.dart';

class _BottomButon extends StatelessWidget {
  const _BottomButon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: () async {
            if (_formRegister.currentState?.validate() ?? false) {
              var state = context.read<NewStudentCubit>().state;
              final validator = context.read<NewStudentCubit>();
              print("No tlp Ortu : ${state.parentPhone}");
              final bool isClear = validator.submissionValidation(
              context,
                phone: state.phone,
                gender: state.gender, 
                outfitSize: state.outfitSize,
                birthDate: state.birthDate,
                parentPhone: state.parentPhone
              );
              if(isClear){
              NewStudentPaymentRoute(
                  fullname: state.fullname,
                  birthDate: state.birthDate,
                  originSchool: state.originSchool,
                  parentName: state.parentName,
                  phone: state.phone,
                  parentPhone: state.parentPhone,
                  outfitSize: state.outfitSize,
                  height: state.height,
                  gender: state.gender,
                  )
                .push(context);
              }
            }
          },
          child: const Text("Pembayaran")),
    );
  }
}
