import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_mobile/repositories/home_repository/models/news_model.dart';
import 'package:mhs_mobile/router/builder.dart';

class CardNews extends StatelessWidget {
  const CardNews({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SMNewsDetailRoute(newsId: news.id ?? 0,).go(context);
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