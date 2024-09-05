import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/modules/home/view/home_page.dart';
import 'package:mhs_mobile/router/builder.dart';

class MenuScreenHome extends StatelessWidget {
  const MenuScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, st) {
      bool isLogin = st.isLogin;
      return BlocBuilder<HomeBloc, HomeState>(builder: (context, st) {
        int roleId = st.profile?.data.roleId ?? 0;
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
                              onPressed: () {},
                            ) : const SizedBox.shrink(),
                            isLogin ? MenuButton(
                              text: 'Profile',
                              onPressed: () {
                                z.close?.call()?.then(
                                      (value) => ProfileRoute().go(context),
                                    );
                              },
                            ) : const SizedBox.shrink(),
                            isLogin ? MenuButton(
                              text: 'Pengaturan',
                              onPressed: () {},
                            ) : const SizedBox.shrink(),
                            MenuButton(
                              text: 'Kebijakan Privasi',
                              onPressed: () {},
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
                                    getIt<AppBloc>().add(SetUserLogout());
                                    getIt<HomeBloc>().add(SetProfileNull());
                                    z.close?.call()?.then(
                                          (value) => HomeRoute().go(context),
                                        );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: successColor,
                                        content: Text(
                                          'Berhasil keluar',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    );
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
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
                color: whiteColor,
                fontSize: fontSizeExtraLarge,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
