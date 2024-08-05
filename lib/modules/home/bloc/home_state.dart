// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Pagination paginationNews;
  final List<NewsModel> news;
  final List<BannerModel> banners;

  const HomeState({
    required this.paginationNews,
    this.news = const [],
    this.banners = const [],
  });

  @override
  List<Object?> get props => [paginationNews, news, banners];

  HomeState copyWith({
    Pagination? paginationNews,
    List<NewsModel>? news,
    List<BannerModel>? banners,
  }) {
    return HomeState(
      paginationNews: paginationNews ?? this.paginationNews,
      news: news ?? this.news,
      banners: banners ?? this.banners,
    );
  }
}
