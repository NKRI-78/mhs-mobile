import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/modules/news_detail/view/news_detail.dart';
import 'package:mhs_mobile/repositories/home_repository/models/news_model.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:shimmer/shimmer.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.news != current.news ||
          previous.loadingNew != current.loadingNew,
      builder: (context, state) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Row(
              children: [
                const Text(
                  'Berita',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    ShowMoreNewsRoute().go(context);
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      color: redColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            if (state.loadingNew)
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * .3,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: const Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: double.infinity,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                '',
                                style: GoogleFonts.roboto().copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 3,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '',
                                style: GoogleFonts.roboto().copyWith(
                                  fontSize: 11,
                                  color:
                                      const Color(0xff000000).withOpacity(.5),
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            else
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: state.news
                    .map((e) => NewWidget(
                          news: e,
                        ))
                    .toList(),
              ),
          ],
        );
      },
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NewsDetailRoute(newsId: news.id ?? 0,).go(context);
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * .3,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: double.infinity,
              child: Image.network(
                news.imageUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      news.title ?? '',
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      news.description ?? '',
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 11,
                        color: const Color(0xff000000).withOpacity(.5),
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
