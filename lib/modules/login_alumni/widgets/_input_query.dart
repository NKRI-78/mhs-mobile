part of '../views/login_alumni_page.dart';

class _InputQuery extends StatelessWidget {
  const _InputQuery();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginAlumniCubit, LoginAlumniState>(
      builder: (context, st) {
        return CustomTextField(
          labelText: 'Nama BEM / Tahun Angkatan',
          onChanged: (value) {
            var cubit = context.read<LoginAlumniCubit>();
            cubit.copyState(cubit.state.copyWith(query: value));
          },
          hintText: "Nama BEM / Tahun Angkatan",
          fillColor: whiteColor.withOpacity(0.10),
          emptyText: "Masukan nama bem / tahun angkatan",
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
        );
      }
    );
  }
}