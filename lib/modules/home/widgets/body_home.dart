import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/modules/home/view/home_page.dart';
import 'package:mhs_mobile/modules/home/widgets/banners_widget.dart';
import 'package:mhs_mobile/modules/home/widgets/footer-address.dart';
import 'package:mhs_mobile/modules/home/widgets/menu_botton/bottom_menu.dart';
import 'package:mhs_mobile/modules/home/widgets/menu_botton/header_menu_student.dart';
import 'package:mhs_mobile/modules/home/widgets/menu_botton/menu_student.dart';
import 'package:mhs_mobile/modules/home/widgets/menus_widget.dart';
import 'package:mhs_mobile/modules/home/widgets/news_widget.dart';
import 'package:mhs_mobile/modules/home/widgets/testimoni_widget.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/background/background_home_scafold.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.profile != current.profile,
      builder: (context, state) {
        bool isWaitingAprovalAdmin =
            state.profile?.data.isWaitingAprovalAdmin ?? false;
        String roleId = state.profile?.data.role?.slug ?? "USER";
        // int roleId = state.profile?.data.roleId ?? 0;
        debugPrint("Data profile Home : $roleId");
        bool isLogin = getIt<AppBloc>().state.isLogin;
        return BackgroundHomeScafold(
            child: RefreshIndicator(
              onRefresh: () async {
                getIt<HomeBloc>().add(HomeInitialData());
              },
              child: ListView(children: [
                        const HeaderHome(),
                        Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 36, bottom: 16),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(20),
                          topEnd: Radius.circular(20)),
                      color: whiteColor),
                  child: DefaultTextStyle(
                    style: const TextStyle(color: Colors.black),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const BannersWidget(),
                        roleId == "STUDENT" ? const MenuStudent() : const MenusWidget(),
                        const TestimoniWidget(),
                        const NewsWidget(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -30,
                  left: 20,
                  right: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: roleId == "STUDENT"
                        ? const HeaderMenuStudent()
                        : isWaitingAprovalAdmin
                            ? BottomMenu(
                                title: 'Menunggu Persetujuan Admin',
                                onPressed: () {},
                              )
                            : isLogin
                                ? BottomMenu(
                                    title: 'Pilih Akun Anda untuk',
                                    onPressed: () {
                                      ChooseRoleRoute().go(context);
                                    },
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: BottomMenu(
                                          title: "Gabung Bersama Kami",
                                          onPressed: () {
                                            RegisterRoute().go(context);
                                          },
                                        ),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        flex: 2,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: const CircleBorder()
                                            ),
                                            onPressed: () {
                                              z.toggle!();
                                            },
                                            child: const Center(
                                              child: Icon(Iconsax.element_3),
                                            )),
                                      )
                                    ],
                                  ),
                  ),
                )
              ],
                        ),
                        const FooterAddress()
                      ]),
            ));
      },
    );
  }
}
