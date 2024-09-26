import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/news_detail/cubit/detail_news_cubit.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.newsId});

  final int newsId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailNewsCubit>(
      create: (context) => DetailNewsCubit()..fetchDetailNews(newsId),
      child: const NewsDetailView()
    );
  }
}

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailNewsCubit, DetailNewsState>(
      buildWhen: (previous, current) =>
      previous.news != current.news || 
      previous.loading != current.loading,
      builder: (context, st) {
        debugPrint("Image : ${st.news?.data.imageUrl}");
        final data = st.news?.data;
        return Scaffold(
          backgroundColor: whiteColor,
          body: CustomScrollView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            slivers: [
              const HeaderSection(
                title: "Berita", 
                isCircle: false,
                isPrimary: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  ImageCard(
                    image: data?.imageUrl ?? "", 
                    radius: 0, 
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      data?.title ?? "",
                      style: const TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSizeExtraLarge
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Html(
                      data: data?.description ?? "-",
                      style: {
                        "a": Style(
                          color: Colors.blue,
                        ),
                      },
                      onLinkTap: (String? url, Map<String, String> attributes, element) async {
                        WebViewRoute(url: url!, title: "MHS-MOBILE").go(context);
                      },
                    ),
                  ),
                ])
              )
            ]
          ),
        );
      }
    );
  }
}