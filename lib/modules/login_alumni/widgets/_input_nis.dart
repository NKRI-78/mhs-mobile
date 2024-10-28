part of '../views/login_alumni_page.dart';

class _InputNis extends StatelessWidget {
  const _InputNis();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginAlumniCubit, LoginAlumniState>(
      builder: (context, st) {
        return CustomTextField(
          labelText: 'NPM (Nomor Pokok Mahasiswa)',
          onChanged: (value) {
            var cubit = context.read<LoginAlumniCubit>();
                cubit.copyState(cubit.state.copyWith(nis: value));
          },
          isPhoneNumber: true,
          maxLength: 9,
          hintText: "NPM (Nomor Pokok Mahasiswa)",
          fillColor: whiteColor.withOpacity(0.10),
          emptyText: "Masukan NIS anda",
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
        );
      }
    );
  }
}