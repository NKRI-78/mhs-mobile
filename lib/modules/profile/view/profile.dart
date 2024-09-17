import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/modules/profile/widgets/detail_user.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(GetProfile()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, st) {
              String nameStudent = st.profile?.data.student?.fullname ?? "" ;
              String nameUser = st.profile?.data.name ?? "" ;
        debugPrint("Student Name : ${st.profile?.data ?? ""} ");

      return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            CustomScrollView(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                const HeaderSection(
                  title: "Profile",
                  isCircle: false,
                  isPrimary: false,
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 260,
                        // color: primaryColor,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Image.asset(
                                  "assets/images/background_kta_mhs.png"),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30),
                                                bottomLeft: Radius.circular(80),
                                                bottomRight: Radius.circular(80)),
                                            border: Border.all(
                                                color: whiteColor, width: 1.0)),
                                        child: Transform.translate(
                                          offset: const Offset(5, -4),
                                          child: ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight: Radius.circular(30),
                                                  bottomLeft: Radius.circular(80),
                                                  bottomRight: Radius.circular(80)),
                                              child: ImageCard(
                                                  image: st.profile?.data.profile
                                                          ?.pictureUrl ??
                                                      "",
                                                  radius: 0,
                                                  height: 131,
                                                  width: double.infinity)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text((nameStudent.isEmpty ? nameUser : nameStudent),
                                              maxLines: 2,
                                              softWrap: true,
                                              overflow: TextOverflow.visible,
                                              style: const TextStyle(
                                                  color: whiteColor,
                                                  fontSize: 30,
                                                  height: 1,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            Text(
                                              st.profile?.data.student?.nisn ?? "-",
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: whiteColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ]))
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              height: 450,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                  color: primaryColor
                ),
              child: st.profile?.data.student != null ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarListUser(detail: "Email :", title: st.profile?.data.email ?? "-"),
                    CarListUser(detail: "Angkatan :", title: st.profile?.data.student?.classYear ?? "-"),
                    CarListUser(detail: "Asal Sekolah :", title: st.profile?.data.student?.originSchool ?? "-"),
                    CarListUser(detail: "No. Tlpn :", title: st.profile?.data.student?.phone ?? ""),
                    CarListUser(detail: "Orang Tua :", title: st.profile?.data.student?.parentName ?? "-"),
                  ],
                ) : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarListUser(detail: "Email :", title: st.profile?.data.email ?? "-"),
                    CarListUser(detail: "No. Tlpn :", title: st.profile?.data.phone ?? "-"),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
