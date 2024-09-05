part of '../view/home_page.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        bool isLogin = state.isLogin;
        return SizedBox(
          width: double.infinity,
          height: isLogin ? 230 : 200,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, st) {
              int roleId = st.profile?.data.roleId ?? 0;
              String nameStudent = st.profile?.data.student?.fullname ?? "-" ;
              String nameUser = st.profile?.data.name ?? "" ;
              bool waitAdmin = st.profile?.data.isWaitingAprovalAdmin ?? false ;

              debugPrint("user name : $nameUser");
              return Stack(
                children: [
                  Positioned(
                    top: isLogin ? 30 : 70,
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
                                isLogin ? (st.profile?.data.student == null ? nameUser : nameStudent) : "Metro Hotel School",
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: greyInputColor.withOpacity(0.5),
                                endIndent: 30,
                              ),
                              roleId == 3 ? const Text(
                                "Motivasi adalah hal yang membuat Anda memulai. Kebiasaan adalah hal yang membuat Anda terus maju...",
                                maxLines: 3,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: fontSizeSmall,
                                  fontWeight: FontWeight.w600
                                ),
                              ) : waitAdmin ? const Text(
                                "Your’e Success to choose you account for, Please wait for approval... ",
                                maxLines: 3,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: fontSizeSmall,
                                  fontWeight: FontWeight.w600
                                ),
                              ) : isLogin ?
                                const Text(
                                    "Anda berada di Beranda Publik, untuk Menyelesaikan Akun, klik tombol di bawah ini",
                                    maxLines: 2,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                logoMhs,
                              ),
                              isLogin
                              ? ElevatedButton(
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
                                )
                              : const SizedBox.shrink()
                            ],
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