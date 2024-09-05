// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Pagination paginationNews;
  final List<NewsModel> news;
  final List<BannerModel>? banners;
  final List<TestimoniData>? testimoni;
  final ProfileModel? profile;
  final bool loadingBanner;
  final bool loadingNew;
  final bool loadingProfile;
  final bool loadingTestimoni;

  const HomeState({
    required this.paginationNews,
    this.news = const [],
    this.banners = const [],
    this.testimoni = const [],
    this.profile,
    this.loadingBanner = true,
    this.loadingNew = true,
    this.loadingProfile = true,
    this.loadingTestimoni = true,
  });

  @override
  List<Object?> get props => [
        paginationNews,
        news,
        banners,
        testimoni,
        profile,
        loadingBanner,
        loadingNew,
        loadingProfile,
        loadingTestimoni,
      ];

  HomeState copyWith({
    Pagination? paginationNews,
    List<NewsModel>? news,
    List<BannerModel>? banners,
    List<TestimoniData>? testimoni,
    ProfileModel? profile,
    bool? loadingBanner,
    bool? loadingNew,
    bool? loadingProfile,
    bool? loadingTestimoni,
  }) {
    return HomeState(
      paginationNews: paginationNews ?? this.paginationNews,
      news: news ?? this.news,
      profile: profile ?? this.profile,
      testimoni: testimoni ?? this.testimoni,
      banners: banners ?? this.banners,
      loadingBanner: loadingBanner ?? this.loadingBanner,
      loadingNew: loadingNew ?? this.loadingNew,
      loadingProfile: loadingProfile ?? this.loadingProfile,
      loadingTestimoni: loadingTestimoni ?? this.loadingTestimoni,
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
      loadingTestimoni: loadingTestimoni,
    );
  }
}
