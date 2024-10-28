import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/grade/cubit/grade_cubit.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';

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
              role == "STUDENT" ? SliverList.list(
                children: [
                  NameCard(name: st.grade?.data?.fullname ?? "-", npm: st.grade?.data?.nisn ?? "-",),
                  ListGradeCard(title: 'Absen', grade: '${st.grade?.data?.grade?.a ?? "Belum Ada Nilai"}',),
                  ListGradeCard(title: 'Praktik', grade: '${st.grade?.data?.grade?.p ?? "Belum Ada Nilai"}',),
                  ListGradeCard(title: 'UTS', grade: '${st.grade?.data?.grade?.uts ?? "Belum Ada Nilai"}',),
                  ListGradeCard(title: 'UAS', grade: '${st.grade?.data?.grade?.uas ?? "Belum Ada Nilai"}',),
                  ListGradeCard(title: 'NILAI', grade: '${st.grade?.data?.grade?.total ?? "Belum Ada Nilai"}',),
                ]
              ) : SliverList.list(
                children: [
                  NameCardStudent(name: st.gradeReport?.data?[0].fullname ?? "-", npm: st.gradeReport?.data?[0].nisn ?? "-",),
                  ListGradeCard(title: 'Absen', grade: '${st.gradeReport?.data?[0].gradeStudent?.a ?? "Belum Ada Nilai"}',),
                  ListGradeCard(title: 'Praktik', grade: '${st.gradeReport?.data?[0].gradeStudent?.p ?? "Belum Ada Nilai"}',),
                  ListGradeCard(title: 'UTS', grade: '${st.gradeReport?.data?[0].gradeStudent?.uts ?? "Belum Ada Nilai"}',),
                  ListGradeCard(title: 'UAS', grade: '${st.gradeReport?.data?[0].gradeStudent?.uas ?? "Belum Ada Nilai"}',),
                  ListGradeCard(title: 'NILAI', grade: '${st.gradeReport?.data?[0].gradeStudent?.total ?? "Belum Ada Nilai"}',),
                ]
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
    super.key, required this.name, required this.npm,
  });

  final String name;
  final String npm;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10)
      ),
       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "NAMA : $name",
            style: const TextStyle(
              color: blackColor,
              fontSize: fontSizeExtraLarge
            ),
          ),
          Text(
            "NPM : $npm",
            style: const TextStyle(
              color: blackColor,
              fontSize: fontSizeExtraLarge
            ),
          ),
        ],
      ),
    );
  }
}
class NameCardStudent extends StatelessWidget {
  const NameCardStudent({
    super.key, required this.name, required this.npm,
  });

  final String name;
  final String npm;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10)
      ),
       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "NAMA SISWA : $name",
            style: const TextStyle(
              color: blackColor,
              fontSize: fontSizeExtraLarge
            ),
          ),
          Text(
            "NPM : $npm",
            style: const TextStyle(
              color: blackColor,
              fontSize: fontSizeExtraLarge
            ),
          ),
        ],
      ),
    );
  }
}

class ListGradeCard extends StatelessWidget {
  const ListGradeCard({
    super.key, required this.title, required this.grade,
  });

  final String title;
  final String grade;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: blackColor,
              fontSize: fontSizeExtraLarge
            ),
          ),
          Text(
            grade,
            style: const TextStyle(
              color: blackColor,
              fontSize: fontSizeExtraLarge
            ),
          ),
        ],
      ),
    );
  }
}