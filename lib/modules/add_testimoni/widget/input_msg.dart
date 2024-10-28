part of "../view/add_testimoni.dart";

class InputMsg extends StatelessWidget {
  const InputMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTestimoniCubit, AddTestimoniState>(
      builder: (context, st) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text(
                "Pesan",
                style: TextStyle(
                  color: blackColor,
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            CustomTextField(
              onChanged: (value) {
                var cubit = context.read<AddTestimoniCubit>();
                cubit.copyState(cubit.state.copyWith(msg: value));
              },
              fillColor: greyColor.withOpacity(0.80),
              isCapital: true,
              hintText: "Pesan",
              maxLines: 5,
              emptyText: "Pesan belum diisi",
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
            )
          ],
        );
      }
    );
  }
}