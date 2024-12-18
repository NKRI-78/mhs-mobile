part of '../views/login_page.dart';

class _InputNis extends StatelessWidget {
  const _InputNis();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'NPM (Nomor Pokok Mahasiswa)',
      onChanged: (value) {},
      isName: true,
      hintText: "",
      maxLength: 9,
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan NIS anda",
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}