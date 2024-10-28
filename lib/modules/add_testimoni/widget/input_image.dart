part of "../view/add_testimoni.dart";

class InputImage extends StatelessWidget {
  const InputImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTestimoniCubit, AddTestimoniState>(
      builder: (context, st) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Foto Terbaikmu",
                style: TextStyle(
                  color: blackColor,
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 200,
              child: InkWell(
                onTap: () async {
                  await context.read<AddTestimoniCubit>().chooseFile(context);
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  color: Colors.blueGrey,
                  strokeWidth: 1,
                  dashPattern: const [5, 5],
                  child: SizedBox.expand(
                    child: FittedBox(
                      child: st.fileImage != null
                        ? Image.file(File(st.fileImage!.path))
                        : const Icon(
                        Icons.image_outlined,
                        color: Colors.blueGrey,
                      ),
                    ),
                  )
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}