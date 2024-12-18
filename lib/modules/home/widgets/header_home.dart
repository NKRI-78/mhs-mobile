part of '../view/home_page.dart';

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return "";
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeEachWord() {
    return split(" ").map((word) => word.capitalize()).join(" ");
  }
}

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        bool isLogin = state.isLogin;

        return SizedBox(
          width: double.infinity,
          height: isLogin ? 190 : 150,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, st) {
              String roleId = st.profile?.data.role?.slug ?? "USER";
              String nameStudent = st.profile?.data.student?.fullname?.capitalizeEachWord() ?? "-" ;
              String nameParent = st.profile?.data.parent?.fullname?.capitalizeEachWord() ?? "-" ;
              String nameUser = st.profile?.data.name?.capitalizeEachWord() ?? "" ;
              bool waitAdmin = st.profile?.data.isWaitingAprovalAdmin ?? false ;
              int countNotif = getIt<HomeBloc>().state.countNotif;
              debugPrint("user name : $countNotif");
              return Stack(
                children: [
                  Positioned(
                    top: isLogin ? 5 : 30,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                isLogin ? "Hello," : "Selamat Datang di,",
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              Text(
                                isLogin ? (st.profile?.data.student != null ? nameStudent : st.profile?.data.parent != null ? nameParent : nameUser) : "Metro Hotel School",
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: greyInputColor.withOpacity(0.5),
                                endIndent: 30,
                              ),
                              roleId == "STUDENT" || roleId == "ALUMNI" || roleId == "PARENT"  ? Text(
                                st.message?.data.messageHome ?? "-",
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: fontSizeSmall,
                                  fontWeight: FontWeight.w600
                                ),
                              ) : waitAdmin ? const Text(
                                "Anda berhasil melakukan pendaftaran siswa baru, Harap menunggu persetujuan admin",
                                maxLines: 3,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: fontSizeSmall,
                                  fontWeight: FontWeight.w600
                                ),
                              ) : isLogin ?
                                const Text(
                                    "Anda berada di Beranda Publik, untuk Menyelesaikan Akun, klik tombol di bawah ini",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: fontSizeSmall,
                                      fontWeight: FontWeight.w600
                                    ),
                                  )
                               : const SizedBox.shrink()
                            ],
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  logoMhs,
                                ),
                                isLogin
                                ? Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Stack(
                                    fit: StackFit.loose,
                                    clipBehavior: Clip.none,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: whiteColor.withOpacity(0.4),
                                          shape: const CircleBorder()
                                        ),
                                          onPressed: () {
                                            z.toggle!();
                                          },
                                          child: const Icon(
                                            Iconsax.element_3,
                                            size: 20,
                                          )
                                        ),
                                        countNotif != 0 ? Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 20),
                                            child:Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: redColor,
                                                borderRadius: BorderRadius.circular(20)
                                              ),
                                              child: Text(
                                                "$countNotif",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: whiteColor
                                                ),
                                              ),
                                            ),
                                          ),
                                        ) : const SizedBox.shrink()
                                    ],
                                  ),
                                )
                                : const SizedBox.shrink()
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
          ),
        );
      }
    );
  }
} 