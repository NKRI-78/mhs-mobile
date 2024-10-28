part of "../view/profile.dart";


class CardKta extends StatelessWidget {
  const CardKta({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, st) {
        String nameStudent = st.profile?.data.student?.fullname ?? "" ;
        String nameUser = st.profile?.data.name ?? "" ;
        debugPrint("Is Selected ? : ${st.isSelected}");
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RepaintBoundary(
            key: ktaImageKey,
            child: Stack(
            clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    "assets/images/KTA-MHS.png",
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 45,
                    left: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: st.fileImage != null
                    ? SizedBox(
                      height: 95,
                      width: 95,
                      child: Stack(
                        fit: StackFit.loose,
                        clipBehavior: Clip.none,
                        children: [
                          AspectRatio(
                            aspectRatio: 1/1,
                            child: Image.file(
                              File(st.fileImage!.path),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                          right: 0,
                          top: 0,
                          child: st.isSelected != false ? InkWell(
                            onTap: () async {
                              await context.read<ProfileCubit>().removeImage();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: blackColor,
                                size: 15,
                              ),
                            ),
                          ) : const SizedBox.shrink(),
                        )
                        ],
                      ),
                    )
                    : SizedBox(
                      height: 95,
                      width: 95,
                      child: AspectRatio(
                        aspectRatio: 1/1, 
                        child: ImageCard(
                          image: st.profile?.data.profile?.pictureUrl ?? "",
                          radius: 0,
                        ),
                      ),
                    ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    bottom: st.profile?.data.student?.nisn != null ? 38 : 25,
                    child: Text((nameStudent.isEmpty ? nameUser : nameStudent),
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.roboto(
                        color: whiteColor,
                        fontSize: fontSizeLarge,
                        height: 1,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  st.profile?.data.student?.nisn != null ? Positioned(
                    left: 25,
                    bottom: 20,
                    child: Text("NPM : ${(st.profile?.data.student?.nisn ?? "-")}",
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.roboto(
                        color: whiteColor,
                        fontSize: fontSizeLarge,
                        height: 1,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ) : const SizedBox.shrink(),
                ],
              ),
          ),
        );
      }
    );
  }
}