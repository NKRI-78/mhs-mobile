part of "../view/add_testimoni.dart";

class InputCaption extends StatelessWidget {
  const InputCaption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Caption :",
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
            cubit.copyState(cubit.state.copyWith(caption: value));
          },
          fillColor: greyColor.withOpacity(0.80),
          isCapital: true,
          hintText: "Caption",
          labelText: 'Caption',
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
        )
      ],
    );
  }
}