part of '../view/register_page.dart';

class _InputPhone extends StatelessWidget {
  const _InputPhone();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChanged: (value) {
        context.read<RegisterCubit>().setState(phone: value);
      },
      labelText: 'No Telepon',
      maxLength: 15,
      hintText: "No Telepon",
      fillColor: whiteColor.withOpacity(0.10),
      emptyText: "Masukan nomor telepon",
      textInputType: TextInputType.number,
      textInputAction: TextInputAction.next,
    );
  }
}
