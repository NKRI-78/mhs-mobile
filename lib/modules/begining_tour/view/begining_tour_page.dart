import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/begining_tour/cubit/begining_tour_cubit.dart';
import 'package:mhs_mobile/modules/begining_tour/models/begining_tour_model.dart';

part '../widgets/_content_widget.dart';
part '../widgets/_button_widget.dart';
part '../widgets/_bottom_info.dart';
part '../widgets/_text_list.dart';

class BeginingTourPage extends StatelessWidget {
  const BeginingTourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BeginingTourCubit(),
      child: const BeginingTourView(),
    );
  }
}

class BeginingTourView extends StatelessWidget {
  const BeginingTourView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: BeginingTourCubit.pageController,
              itemCount: listTour.length,
              onPageChanged: (value) {
                context.read<BeginingTourCubit>().changeIndex(value);
              },
              itemBuilder: (context, index) => _ContentWidget(listTour[index]),
            ),
          ),
        ],
      )),
    );
  }
}
