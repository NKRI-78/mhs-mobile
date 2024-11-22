import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/absence/cubit/absence_cubit.dart';
import 'package:mhs_mobile/modules/absence/widgets/card_absence.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';

class AbsencePage extends StatelessWidget {
  const AbsencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc()..add(GetProfile()),
        ),
        BlocProvider<AbsenceCubit>(
          create: (BuildContext context) => AbsenceCubit(),
        ),
      ], child: const AbsenceView(),
    );
  }
}

class AbsenceView extends StatelessWidget {
  const AbsenceView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, st) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<HomeBloc>().add(GetProfile());
            },
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                HeaderSection(
                  title: "Absensi", 
                  isCircle: false,
                  isPrimary: true,
                  widgetRight: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () async {
                          var result = await BarcodeScanner.scan();
                          if (context.mounted) {
                            if(result.rawContent.isEmpty){
                              if (context.mounted) {
                                ShowSnackbar.snackbar(context, "Scan dibatalkan", '', errorColor);
                              }
                            }else {
                              await context.read<AbsenceCubit>().getCheckIn(context, result.rawContent);
                            }
                            if(context.mounted)
                            {
                              context.read<HomeBloc>().add(GetProfile());
                            }
                          }
                        },
                        child: const Row(
                          children: [
                            Text(
                              "Scan",
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: fontSizeExtraLarge
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.qr_code_scanner,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                st.loadingProfile ? const SliverFillRemaining(
                  child: Center(child: LoadingPage()),
                ) : st.profile!.data.student!.attendanceStudents!.isEmpty ? const SliverFillRemaining(
                  child: Center(child: EmptyPage(msg: "Kamu belum absen"))) :  SliverList.builder(
                  itemCount: st.profile?.data.student?.attendanceStudents?.length ?? 0,
                  itemBuilder: (context, index) {
                  final absence = st.profile!.data.student!.attendanceStudents![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: CardAbsence(absence: absence),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
