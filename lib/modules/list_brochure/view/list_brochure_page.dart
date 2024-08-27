import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/list_brochure/cubit/list_brocure_cubit.dart';
import 'package:mhs_mobile/modules/list_brochure/widgets/card_brochure.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';

class ListBrochurePage extends StatelessWidget {
  const ListBrochurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBrocureCubit()..fetchBrochure(),
      child: const ListBrochureView(),
    );
  }
}

class ListBrochureView extends StatelessWidget {
  const ListBrochureView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBrocureCubit, ListBrocureState>(
      builder: (context, st) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: CustomScrollView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            slivers: [
              const HeaderSection(
                title: "Brochure", 
                isCircle: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  ListView(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: st.document.map((e) => CardBrochure(document: e)).toList(),
                  )
                ])
              )
            ]
          ),
        );
      }
    );
  }
}