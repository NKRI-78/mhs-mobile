// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Pagination paginationNews;
  final List<NewsModel> news;
  final List<BannerModel> banners;
  final bool loadingBanner;
  final bool loadingNew;

  const HomeState({
    required this.paginationNews,
    this.news = const [],
    this.banners = const [],
    this.loadingBanner = true,
    this.loadingNew = true,
  });

  @override
  List<Object?> get props => [
        paginationNews,
        news,
        banners,
        loadingBanner,
        loadingNew,
      ];

  HomeState copyWith({
    Pagination? paginationNews,
    List<NewsModel>? news,
    List<BannerModel>? banners,
    bool? loadingBanner,
    bool? loadingNew,
  }) {
    return HomeState(
      paginationNews: paginationNews ?? this.paginationNews,
      news: news ?? this.news,
      banners: banners ?? this.banners,
      loadingBanner: loadingBanner ?? this.loadingBanner,
      loadingNew: loadingNew ?? this.loadingNew,
    );
  }
}
