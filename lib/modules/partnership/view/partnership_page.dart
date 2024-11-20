import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/helper.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/partnership/cubit/partnership_cubit.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';


class PartnershipPage extends StatelessWidget {
  const PartnershipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PartnershipCubit()..fetchPartnership(),
      child: const PartnershipView()
    );
  }
}

class PartnershipView extends StatelessWidget {
  const PartnershipView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnershipCubit, PartnershipState>(
    
      builder: (context, st) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: CustomScrollView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            slivers: [
              const HeaderSection(
                title: "Partnership", 
                isCircle: true,
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                sliver : st.loadingPartnership ? const SliverFillRemaining(
                  child: LoadingPage(),
                ) : st.partnership.isEmpty ? const SliverFillRemaining(
                  child: Center(child: EmptyPage(msg: "Tidak ada partnership"))) : SliverGrid.builder(
                  itemCount: st.partnership.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                  ),  
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      // color: redColor,
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          Helper.openLink(url: st.partnership[index].description ?? "-", context: context);
                        },
                        child: ImageCard(
                          image: st.partnership[index].fileUrl ?? "-", 
                          fit: BoxFit.contain,
                          radius: 0, 
                          width: double.infinity
                        ),
                      ),
                    );
                  },
                ),
              )
            ]
          ),
        );
      }
    );
  }
}