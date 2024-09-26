import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mhs_mobile/misc/download_manager.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/profile/cubit/profile_cubit.dart';
import 'package:mhs_mobile/modules/profile/cubit/profile_state.dart';
import 'package:mhs_mobile/modules/profile/widgets/detail_user.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

part '../widgets/_button_download.dart';

final GlobalKey ktaImageKey = GlobalKey();

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit()..fetchProfile(),
      child: const ProfileView()
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, st) {
          String nameStudent = st.profile?.data.student?.fullname ?? "" ;
      String nameUser = st.profile?.data.name ?? "" ;
        debugPrint("Is Selected ? : ${st.isSelected}");
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: RepaintBoundary(
                            key: ktaImageKey,
                            child: Stack(
                            clipBehavior: Clip.antiAlias,
                                children: [
                                  Image.asset(
                                    "assets/images/KTA-MHS.png",
                                    width: double.infinity,
                                  ),
                                  Positioned(
                                    top: 50,
                                    left: 20,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: st.fileImage != null
                                    ? SizedBox(
                                      height: 95,
                                      width: 95,
                                      child: AspectRatio(
                                        aspectRatio: 1/1,
                                        child: Image.file(
                                          File(st.fileImage!.path),
                                          fit: BoxFit.cover,
                                        ),
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
                                    bottom: st.profile?.data.student?.nisn != null ? 35 : 30,
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
                                    bottom: 10,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child:  _ButtonDownload(fullname: (nameStudent.isEmpty ? nameUser : nameStudent)),
                        ),
                    ]))
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                  padding: const EdgeInsets.only(top: 30,right: 30,left: 30),
                  width: double.infinity,
                  height: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35), 
                    topRight: Radius.circular(35)),
                    color: primaryColor
                  ),
                  child: st.profile?.data.student != null ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarListUser(detail: "Email :", title: st.profile?.data.email ?? "-"),
                        CarListUser(detail: "Angkatan :", title: st.profile?.data.student?.schoolGeneration?.generation ?? "-"),
                        CarListUser(detail: "Asal Sekolah :", title: st.profile?.data.student?.originSchool ?? "-"),
                        CarListUser(detail: "No. Tlpn :", title: st.profile?.data.student?.phone ?? ""),
                        CarListUser(detail: "Orang Tua :", title: st.profile?.data.student?.parentName ?? "-"),
                        // const SizedBox(
                        //   height: 60,
                        // ),
                        // SizedBox(
                        //   width: double.infinity,
                        //   height: 50,
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //       side: const BorderSide()
                        //     ),
                        //     onPressed: (){}, 
                        //     child: const Text(
                        //       "Ubah Profil"
                        //     ),
                        //   ),
                        // )
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
        }
      );
    }
  
}
