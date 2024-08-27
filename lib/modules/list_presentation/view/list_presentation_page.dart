import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/list_presentation/cubit/list_presentation_cubit.dart';
import 'package:mhs_mobile/modules/list_presentation/widgets/card_presentation.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class ListPresentationPage extends StatelessWidget {
  const ListPresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListPresentationCubit()..fetchPresentation(),
      child: const ListPresentationView(),
    );
  }
}

class ListPresentationView extends StatelessWidget {
  const ListPresentationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListPresentationCubit, ListPresentationState>(
        builder: (context, st) {
      return Scaffold(
        backgroundColor: whiteColor,
        body: CustomScrollView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const HeaderSection(
                title: "Presentation",
                isCircle: true,
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: st.document
                      .map((e) => CardPresentation(document: e))
                      .toList(),
                )
              ]))
            ]),
      );
    });
  }
}
