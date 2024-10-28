part of "../view/profile.dart";

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, st) {
        String nameStudent = st.profile?.data.student?.fullname ?? "" ;
        String nameUser = st.profile?.data.name ?? "" ;
        String nameParent = st.profile?.data.parent?.fullname ?? "-" ;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: [
                  st.fileImage != null
                    ? Stack(
                      fit: StackFit.loose,
                      children: [
                        CircleAvatar(
                            maxRadius: 70,
                            minRadius: 20,
                            backgroundImage: Image.file(
                            File(st.fileImage!.path),
                            fit: BoxFit.fill,
                          ).image,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: st.isSelected != false ?  InkWell(
                            onTap: () async {
                              await context.read<ProfileCubit>().removeImage();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: whiteColor,
                              ),
                            ),
                          ): const SizedBox.shrink(),
                        )
                      ],
                    ) : ImageCircle(image: st.profile?.data.profile?.pictureUrl ?? "", radius: 70),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: !st.isSelected ?  InkWell(
                      onTap: () async {
                        await context.read<ProfileCubit>().chooseFile(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: whiteColor,
                        ),
                      ),
                    ) : InkWell(
                      onTap: () async {
                        context.read<ProfileCubit>().uploadProfile(context: context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Icon(
                          Icons.save,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text((st.profile?.data.student != null ? nameStudent : st.profile?.data.parent != null ? nameParent : nameUser),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: GoogleFonts.roboto(
                    color: blackColor,
                    fontSize: fontSizeLarge,
                    height: 1,
                    fontWeight: FontWeight.w900
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}