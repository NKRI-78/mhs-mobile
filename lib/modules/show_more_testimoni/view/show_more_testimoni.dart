import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/show_more_testimoni/cubit/show_more_testimoni_cubit.dart';
import 'package:mhs_mobile/modules/show_more_testimoni/widgets/testimoni_card.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';

class ShowMoreTestimoniPage extends StatelessWidget {
  const ShowMoreTestimoniPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowMoreTestimoniCubit()..fetchTestimoni(),
      child: const ShowMoreTestimoniView(),
    );
  }
}

class ShowMoreTestimoniView extends StatelessWidget {
  const ShowMoreTestimoniView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ShowMoreTestimoniCubit, ShowMoreTestimoniState>(
      buildWhen: (previous, current) => previous.testimoni != current.testimoni,
      builder: (context, st) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: CustomScrollView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const HeaderSection(
                title: "Testimoni", 
                isCircle: true,
                isPrimary: false,
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
                sliver: SliverGrid.builder(
                  itemCount: st.testimoni.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 60,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 1.3
                  ), 
                  itemBuilder: (context, index) {
                    final data = st.testimoni[index];
                    if(st.testimoni.isEmpty)
                    {
                      debugPrint("Kepanggil ?");
                      const EmptyPage(msg: "Media kosong");
                    }
                    return st.loadingTestimoni ? const LoadingPage() : 
                    TestimoniCard(
                      testimoni: data,
                    );
                  },
                ),
              )
            ],
          ),
        );
      }
    );
  }
}