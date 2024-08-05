import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.banners != current.banners,
      builder: (context, state) {
        if (state.banners.isEmpty) return const SizedBox.shrink();
        return Container(
          height: MediaQuery.of(context).size.width * .4,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Image.network(state.banners.first.bannerLink ?? ''),
        );
      },
    );
  }
}
