part of '../view/new_student_page.dart';

class _InputClothesSize extends StatelessWidget {
  const _InputClothesSize();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: CustomTextField(
        labelText: 'Ukuran Baju',
        onChanged: (value) {},
        isName: true,
        hintText: "",
        fillColor: whiteColor.withOpacity(0.10),
        emptyText: "Masukan ukuran baju anda",
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}