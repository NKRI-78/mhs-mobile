import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/modules/home/view/home_page.dart';
import 'package:mhs_mobile/modules/home/widgets/banners_widget.dart';
import 'package:mhs_mobile/modules/home/widgets/footer_address.dart';
import 'package:mhs_mobile/modules/home/widgets/menu_botton/bottom_menu.dart';
import 'package:mhs_mobile/modules/home/widgets/menu_botton/header_menu_alumni.dart';
import 'package:mhs_mobile/modules/home/widgets/menu_botton/header_menu_parent.dart';
import 'package:mhs_mobile/modules/home/widgets/menu_botton/header_menu_student.dart';
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
        bool isWaitingAprovalAdmin = state.profile?.data.isWaitingAprovalAdmin ?? false;
        final waitingPaymentNewStudent = state.profile?.data.waitingPaymentNewStudent;
        String roleId = state.profile?.data.role?.slug ?? "USER";
        // int roleId = state.profile?.data.roleId ?? 0;
        debugPrint("Data profile Home : $roleId");
        bool isLogin = getIt<AppBloc>().state.isLogin;
        return BackgroundHomeScafold(
            child: RefreshIndicator(
              onRefresh: () async {
                getIt<HomeBloc>().add(HomeInitialData());
              },
              child: ListView(
                children: [
              const HeaderHome(),
              Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 25, bottom: 16),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(20),
                          topEnd: Radius.circular(20)),
                      color: whiteColor),
                  child: DefaultTextStyle(
                    style: const TextStyle(color: Colors.black),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const BannersWidget(),
                        MenusWidget(role: roleId,),
                        const TestimoniWidget(),
                        const NewsWidget(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -35,
                  left: 10,
                  right: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: 
                      roleId == "STUDENT" ? const HeaderMenuStudent()
                    : roleId == "PARENT" ? const HeaderMenuParent()
                    : roleId == "ALUMNI" ? HeaderMenuAlumni(nameStudent: state.profile?.data.student?.testimoni?.message ?? "",) 
                    : waitingPaymentNewStudent != null ?
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greenColor,
                  
                          padding: const EdgeInsets.symmetric(vertical: 15)
                        ),
                        child: const Text("Menunggu Pembayaran"),
                        onPressed: () {
                          WaitingPaymentRoute(id: state.profile?.data.waitingPaymentNewStudent?.paymentNumber.toString() ?? "").go(context);
                        },
                      ) : isWaitingAprovalAdmin
                        ? BottomMenu(
                            title: 'Menunggu Persetujuan Admin',
                            onPressed: () {},
                          )
                        : isLogin
                      ? BottomMenu(
                          title: 'Pilih Akun Anda',
                          onPressed: () {
                            ChooseRoleRoute().go(context);
                          },
                        )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Expanded(
                          flex: 6,
                          child: ElevatedButton(
                              onPressed: () {
                                RegisterRoute().go(context);
                              },
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                    "Gabung Bersama Kami",
                                    style: TextStyle(
                                      color: whiteColor,
                                      height: 1,
                                      fontSize: fontSizeLarge,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
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
