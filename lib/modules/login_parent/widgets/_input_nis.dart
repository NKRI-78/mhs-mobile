part of '../views/login_parent_page.dart';

class _InputNis extends StatelessWidget {
  const _InputNis();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginParentCubit, LoginPaarentState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'NPM (Nomor Pokok Mahasiswa)',
          onChanged: (value) {
            var cubit = context.read<LoginParentCubit>();
            cubit.copyState(cubit.state.copyWith(nis: value));
          },
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