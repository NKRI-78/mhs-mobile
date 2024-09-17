import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/list_modul/cubit/list_modul_cubit.dart';
import 'package:mhs_mobile/modules/list_modul/widgets/card_module.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';

class ListModulPage extends StatelessWidget {
  const ListModulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListModulCubit()..fetchModul(),
      child: const ListModulView(),
    );
  }
}

class ListModulView extends StatelessWidget {
  const ListModulView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListModulCubit, ListModulState>(
      builder: (context, st) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: CustomScrollView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            slivers: [
              const HeaderSection(
                title: "Modul", 
                isCircle: true,
              ),
              st.loadingModul ? const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator.adaptive()),
                ) : st.document.isEmpty ? const SliverFillRemaining(
                  child: Center(child: EmptyPage(msg: "Tidak ada modul"))) : SliverList(
                delegate: SliverChildListDelegate([
                  ListView(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: st.document.map((e) => CardModul(document: e)).toList(),
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