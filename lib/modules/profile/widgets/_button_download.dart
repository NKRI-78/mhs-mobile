part of '../view/profile.dart';

class _ButtonDownload extends StatelessWidget {
  const _ButtonDownload({required this.fullname});

  final String fullname;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, st) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            !st.isSelected ? SizedBox(
              width: 150,
              height: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor
                ),
                onPressed: () async {
                  await context.read<ProfileCubit>().chooseFile(context);
                }, 
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 15,),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Ubah Foto", 
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: fontSizeSmall,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
              ),
            ): SizedBox(
              width: 150,
              height: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor
                ),
                onPressed: () async {
                  context.read<ProfileCubit>().uploadProfile(context: context);
                }, 
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 15,),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Simpan Foto", 
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: fontSizeSmall,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
              ),
            ),
            SizedBox(
              width: 150,
              height: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor
                ),
                onPressed: st.avatar == "" || st.isSelected ? null : () async {
                  DownloadHelper.downloadWidget(ktaImageKey, "${DateFormat('yyyyddMMHHmm').format(DateTime.now())}-kta-mhs-mobile-${fullname.replaceAll(" ", "-").toLowerCase()}.png", context);
                }, 
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.download, size: 15,),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Download", 
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: fontSizeSmall,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
              ),
            ),
          ],
        );
      }
    );
  }
}