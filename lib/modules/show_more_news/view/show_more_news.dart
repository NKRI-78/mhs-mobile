import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/show_more_news/cubit/show_more_news_cubit.dart';
import 'package:mhs_mobile/modules/show_more_news/widgets/card_news.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShowMoreNewsPage extends StatelessWidget {
  const ShowMoreNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowMoreNewsCubit()..fetchNews(),
      child: const ShowMoreNewsView(),
    );
  }
}

class ShowMoreNewsView extends StatelessWidget {
  const ShowMoreNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowMoreNewsCubit, ShowMoreNewsState>(
      buildWhen: (previous, current) => previous.news != current.news,
      builder: (context, st) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: SmartRefresher(
          onRefresh: () async {
            await context.read<ShowMoreNewsCubit>().onRefresh();
          },
          enablePullUp: st.newsPagination?.next == null ? false : true,
          enablePullDown: true,
          onLoading: () async {
            await context.read<ShowMoreNewsCubit>().loadMoreNews();
          },
          controller: ShowMoreNewsCubit.newsRefreshCtrl,
            child: CustomScrollView(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                const HeaderSection(
                  title: "Berita", 
                  isCircle: true,
                  isPrimary: false,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    ListView(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: st.news.map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CardNews(news: e),
                      )).toList(),
                    )
                  ]),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}