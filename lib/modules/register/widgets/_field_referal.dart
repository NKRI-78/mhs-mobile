part of '../view/register_page.dart';

class FieldReferral extends StatelessWidget {
  const FieldReferral({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChanged: (value) {
        context.read<RegisterCubit>().setState(referral: value);
      },
      labelText: "Kode Referral (Optional)",
      hintText: "Kode Referral (Optional)",
      isCapital: true,
      fillColor: whiteColor.withOpacity(0.10),
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.done,
    );
  }
}