import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/modal.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/modules/home/view/home_page.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';

class MenuScreenHome extends StatelessWidget {
  const MenuScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, st) {
      bool isLogin = st.isLogin;
      return BlocBuilder<HomeBloc, HomeState>(builder: (context, st) {
        String roleId = st.profile?.data.role?.slug ?? "";
        int countNotif = context.read<HomeBloc>().state.countNotif;
        return Scaffold(
            backgroundColor: primaryColor,
            body: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  color: primaryColor,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      circleDownMenu,
                      height: 150,
                      width: 150,
                      fit: BoxFit.fill,
                    )),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150, bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isLogin ? MenuButton(
                              text: 'Notifikasi',
                              onPressed: () {
                                z.close?.call()?.then(
                                  (value) => NotificationRoute().go(context),
                                );
                              },
                              countNotif: countNotif,
                            ) : const SizedBox.shrink(),
                            isLogin ? MenuButton(
                              text: 'Profile',
                              onPressed: () {
                                z.close?.call()?.then(
                                      (value) => ProfileRoute().go(context),
                                    );
                              },
                            ) : const SizedBox.shrink(),
                            // isLogin ? MenuButton(
                            //   text: 'Pengaturan',
                            //   onPressed: () {
                            //     z.close?.call()?.then(
                            //       (value) => SettingRoute().go(context),
                            //     );
                            //   },
                            // ) : const SizedBox.shrink(),
                            MenuButton(
                              text: 'Kebijakan Privasi',
                              onPressed: () {
                                z.close?.call()?.then(
                                  (value) => PrivacyRoute().go(context),
                                );
                              },
                            ),
                            // MenuButton(
                            //   text: 'Tutup',
                            //   onPressed: () {
                            //     z.toggle!();
                            //   },
                            // ),
                          ],
                        ),
                        isLogin
                            ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    GeneralModal.showConfirmModal(context: context, locationImage: logoutIcon, msg: "Apakah anda yakin ingin keluar ?", onPressed: () {
                                      // getIt<HomeBloc>().add(DeleteFcm());
                                      getIt<AppBloc>().add(SetUserLogout());
                                      getIt<HomeBloc>().add(SetProfileNull());
                                      z.close?.call()?.then(
                                            (value) => HomeRoute().go(context),
                                          );
                                      Navigator.pop(context);
                                      ShowSnackbar.snackbar(context, "Berhasil Keluar", '', successColor);
                                    },);
                                  },
                                  child: const Text(
                                    "Keluar",
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                            )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
              ],
            ));
      });
    });
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.text,
    required this.onPressed, 
    this.countNotif,
  });

  final String text;
  final int? countNotif;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: const TextStyle(
                    color: whiteColor,
                    fontSize: fontSizeExtraLarge,
                    fontWeight: FontWeight.bold),
              )),
          text == "Notifikasi" && countNotif != 0 ? Positioned(
            left: 95,
            top: 5,
            child: Container(
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
          ) : Container()
        ],
      ),
    );
  }
}
