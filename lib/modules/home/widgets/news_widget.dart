import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/repositories/home_repository/models/news_model.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';

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
          padding: EdgeInsets.zero,
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
            const SizedBox(
              height: 8,
            ),
            state.loadingNew ? const LoadingPage(height: .20,) : state.news.isEmpty ? const EmptyPage(msg: "Tidak ada berita", height: .1,noImage: false,) : ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: state.news
                .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: NewWidget(
                    news: e,
                  ),
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
        ShowMoreNewsRoute().go(context);
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * .41,
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
              width: 180,
              height: double.infinity,
              child: Image.network(
                news.imageUrl ?? '',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      news.description?.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), "") ?? '',
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 11,
                        color: const Color(0xff000000).withOpacity(.5),
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        SMNewsDetailRoute(newsId: news.id ?? 0,).go(context);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              "Lihat selengkapnya",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: fontSizeOverExtraSmall,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              size: 10,
                              
                            )
                        ],
                      ),
                    )
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
