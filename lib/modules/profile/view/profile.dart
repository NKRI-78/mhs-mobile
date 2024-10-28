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
import 'package:mhs_mobile/widgets/images/image_card.dart';
import 'package:mhs_mobile/widgets/images/image_circle.dart';

part '../widgets/_button_download.dart';
part '../widgets/card_kta.dart';
part '../widgets/avatar_profile.dart';

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
        String nameParent = st.profile?.data.parent?.fullname ?? "-" ;
        debugPrint("Avatar ? : ${st.avatar}");
          return Scaffold(
            appBar: AppBar(
              title: const Text("Profile"),
            ),
            backgroundColor: whiteColor,
            body: Column(
              children: <Widget>[
                st.profile?.data.student == null || st.profile?.data.role?.slug == "ALUMNI" ? const AvatarProfile() : const CardKta() ,
                st.profile?.data.student == null || st.profile?.data.role?.slug == "ALUMNI" ? const SizedBox.shrink() : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child:  _ButtonDownload(fullname: (st.profile?.data.student != null ? nameStudent : st.profile?.data.parent != null ? nameParent : nameUser)),
                ),
                Expanded(
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
                      ],
                    ) : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CarListUser(detail: "Nama :", title: st.profile?.data.name ?? "-"),
                        CarListUser(detail: "Email :", title: st.profile?.data.email ?? "-"),
                        CarListUser(detail: "No. Tlpn :", title: st.profile?.data.phone ?? "-"),
                        st.profile?.data.children != null ? CarListUser(detail: "Nama Siswa :", title: st.profile?.data.children?[0].fullname ?? "-") : const SizedBox.shrink(),
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
