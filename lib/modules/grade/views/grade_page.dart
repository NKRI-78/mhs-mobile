import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/grade/cubit/grade_cubit.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class GradePage extends StatelessWidget {
  const GradePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GradeCubit()..fetchGrade()..fetchGradeStudentReport(),
      child: const GradeView(),
    );
  }
}

class GradeView extends StatelessWidget {
  const GradeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GradeCubit, GradeState>(
      builder: (context, st) {
        String role = getIt<HomeBloc>().state.profile?.data.role?.slug ?? "USER";
        debugPrint("Role : $role");
        return Scaffold(
          backgroundColor: whiteColor,
          body: CustomScrollView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const HeaderSection(
                title: "Nilai", 
                isCircle: false,
                isPrimary: true,
              ),
              SliverToBoxAdapter(
                child: role == "STUDENT" ? 
                NameCard(
                  name: st.grade?.data?.fullname ?? "-", 
                  npm: st.grade?.data?.nisn ?? "-", 
                  pictureUrl: st.grade?.data?.user?.profile?.pictureUrl ?? "-",
                ): NameCardStudent(
                  name: st.gradeReport?.data?[0].fullname ?? "-", 
                  npm: st.gradeReport?.data?[0].nisn ?? "-", 
                  pictureUrl: st.gradeReport?.data?[0].user?.profile?.pictureUrl ?? "-",
                ),
              ),
              role == "STUDENT" ? SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.3,
                  children: [
                    ListGradeCard(
                      title: 'Absen', 
                      grade: '${st.grade?.data?.grade?.a ?? "N/A"}', 
                      iconColor: gradeAbsenColor,
                      image: absenIcon,
                    ),
                    ListGradeCard(
                      title: 'Praktik', 
                      grade: '${st.grade?.data?.grade?.p ?? "N/A"}', 
                      iconColor: gradePraktikColor,
                      image: praktikIcon,
                    ),
                    ListGradeCard(
                      title: 'UTS', 
                      grade: '${st.grade?.data?.grade?.uts ?? "N/A"}', 
                      iconColor: gradeUtsColor,
                      image: utsIcon,
                    ),
                    ListGradeCard(
                      title: 'UAS', 
                      grade: '${st.grade?.data?.grade?.uas ?? "N/A"}', 
                      iconColor: gradeUasColor,
                      image: uasIcon,
                    ),
                    ListGradeCard(
                      title: 'INDEX NILAI', 
                      grade: '${st.grade?.data?.grade?.total ?? "N/A"}', 
                      iconColor: gradeIpkColor,
                      image: totalIcon,
                    ),
                  ],
                ),
              ) : SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.3,
                  children: [
                    ListGradeCard(
                      title: 'Absen', 
                      grade: '${st.gradeReport?.data?[0].gradeStudent?.a ?? "N/A"}', 
                      iconColor: gradeAbsenColor,
                      image: absenIcon,
                    ),
                    ListGradeCard(
                      title: 'Praktik', 
                      grade: '${st.gradeReport?.data?[0].gradeStudent?.p ?? "N/A"}', 
                      iconColor: gradePraktikColor,
                      image: praktikIcon,
                    ),
                    ListGradeCard(
                      title: 'UTS', 
                      grade: '${st.gradeReport?.data?[0].gradeStudent?.uts ?? "N/A"}', 
                      iconColor: gradeUtsColor,
                      image: utsIcon,
                    ),
                    ListGradeCard(
                      title: 'UAS', 
                      grade: '${st.gradeReport?.data?[0].gradeStudent?.uas ?? "N/A"}', 
                      iconColor: gradeUasColor,
                      image: uasIcon,
                    ),
                    ListGradeCard(
                      title: 'INDEX NILAI', 
                      grade: '${st.gradeReport?.data?[0].gradeStudent?.total ?? "N/A"}', 
                      iconColor: gradeIpkColor,
                      image: totalIcon,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}

class NameCard extends StatelessWidget {
  const NameCard({
    super.key, required this.name, required this.npm, required this.pictureUrl,
  });

  final String name;
  final String npm;
  final String pictureUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageCard(image: pictureUrl, radius: 10, width: 110, height: 110,)
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            color: blackColor,
            fontSize: fontSizeOverLarge,
            fontWeight: FontWeight.w600
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            npm,
            style: const TextStyle(
              color: blackColor,
              fontSize: fontSizeExtraLarge,
              fontWeight: FontWeight.w500
            ),
          ),
        )
      ],
    );
  }
}
class NameCardStudent extends StatelessWidget {
  const NameCardStudent({
    super.key, required this.name, required this.npm, required this.pictureUrl,
  });

  final String name;
  final String npm;
  final String pictureUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageCard(image: pictureUrl, radius: 10, width: 110, height: 110,)
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            color: blackColor,
            fontSize: fontSizeOverLarge,
            fontWeight: FontWeight.w600
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            npm,
            style: const TextStyle(
              color: blackColor,
              fontSize: fontSizeExtraLarge,
              fontWeight: FontWeight.w500
            ),
          ),
        )
      ],
    );
  }
}

class ListGradeCard extends StatelessWidget {
  const ListGradeCard({
    super.key, required this.title, required this.grade, required this.iconColor, required this.image,
  });

  final String title;
  final String grade;
  final Color iconColor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,),
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.fromBorderSide(BorderSide(color: blackColor.withOpacity(0.15)))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  grade,
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Penilaian",
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: fontSizeSmall,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: fontSizeLarge,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 65,
              height: 65,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100), 
                    bottomLeft: Radius.circular(100), 
                    bottomRight: Radius.circular(100), 
                    topRight: Radius.circular(40)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    image,
                    width: 10,
                    height: 10,
                  ),
                ),
              ),
          )
        ],
      ),
    );
  }
}