import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

int currentIndexMultipleImg = 0;

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.banners != current.banners ||
            previous.loadingBanner != current.loadingBanner,
        builder: (context, st) {
          if (st.loadingBanner || st.banners!.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ImageCard(image: "", radius: 20, width: double.infinity),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: 152.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                initialPage: 0,
                onPageChanged: (int i, CarouselPageChangedReason reason) {
                  currentIndexMultipleImg = i;
                },
              ),
              itemCount: st.banners?.length ?? 0,
              itemBuilder: (context, index, realIndex) {
                final data = st.banners?[index];
                return InkWell(
                  onTap: () {
                    if(data!.postLink != "-" && data.postLink!.isNotEmpty){
                      WebViewRoute(url: data.postLink ?? "", title: data.name ?? "").go(context);
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: ImageCard(
                      image: data?.bannerLink ?? "",
                      height: 180,
                      radius: 16,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
