import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/modules/home/widgets/card/testimoni_card.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';

class TestimoniWidget extends StatelessWidget {
  const TestimoniWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.loadingTestimoni != current.loadingTestimoni,
      builder: (context, st) {
        debugPrint("Loading Testimoni ? ${st.loadingTestimoni}");
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 3),
              child: Row(
                children: [
                  const Text(
                    'Testimoni',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      ShowMoreTestimoniRoute().go(context);
                    },
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color: redColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 40),
                scrollDirection: Axis.horizontal,
                child: st.loadingTestimoni ? const LoadingPage(height: .20,) : st.testimoni!.isEmpty ? const EmptyPage(msg: "Tidak ada testimoni", height: .1,noImage: false,) :  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: st.testimoni!.map((e) => Padding(
                padding: const EdgeInsets.only(top: 10, right: 10,),
                child: InkWell(
                  onTap: () {
                    ShowMoreTestimoniRoute().go(context);
                  },
                  child: TestimoniCard(
                        testimoni: e,
                      ),
                ),
              ))
              .toList(),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}