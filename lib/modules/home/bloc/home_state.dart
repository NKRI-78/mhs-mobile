// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Pagination paginationNews;
  final List<NewsModel> news;
  final List<BannerModel>? banners;
  final ProfileModel? profile;
  final bool loadingBanner;
  final bool loadingNew;
  final bool loadingProfile;

  const HomeState({
    required this.paginationNews,
    this.news = const [],
    this.banners = const [],
    this.profile,
    this.loadingBanner = true,
    this.loadingNew = true,
    this.loadingProfile = true,
  });

  @override
  List<Object?> get props => [
        paginationNews,
        news,
        banners,
        profile,
        loadingBanner,
        loadingNew,
        loadingProfile,
      ];

  HomeState copyWith({
    Pagination? paginationNews,
    List<NewsModel>? news,
    List<BannerModel>? banners,
    ProfileModel? profile,
    bool? loadingBanner,
    bool? loadingNew,
    bool? loadingProfile,
  }) {
    return HomeState(
      paginationNews: paginationNews ?? this.paginationNews,
      news: news ?? this.news,
      profile: profile ?? this.profile,
      banners: banners ?? this.banners,
      loadingBanner: loadingBanner ?? this.loadingBanner,
      loadingNew: loadingNew ?? this.loadingNew,
      loadingProfile: loadingProfile ?? this.loadingProfile,
    );
  }

  HomeState setProfileNull() {
    return HomeState(
      paginationNews: paginationNews,
      news: news,
      profile: null,
      banners: banners,
      loadingBanner: loadingBanner,
      loadingNew: loadingNew,
      loadingProfile: loadingProfile,
    );
  }
}
