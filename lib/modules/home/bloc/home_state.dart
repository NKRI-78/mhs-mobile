// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Pagination paginationNews;
  final List<NewsModel> news;
  final List<BannerModel>? banners;
  final List<TestimoniData>? testimoni;
  final ProfileModel? profile;
  final MessageHomeModel? message;
  final bool loadingBanner;
  final bool loadingNew;
  final bool loadingProfile;
  final bool loadingMessage;
  final bool loadingTestimoni;

  const HomeState({
    required this.paginationNews,
    this.news = const [],
    this.banners = const [],
    this.testimoni = const [],
    this.profile,
    this.message,
    this.loadingBanner = true,
    this.loadingNew = false,
    this.loadingProfile = true,
    this.loadingMessage = true,
    this.loadingTestimoni = false,
  });

  @override
  List<Object?> get props => [
        paginationNews,
        news,
        banners,
        testimoni,
        profile,
        message,
        loadingBanner,
        loadingNew,
        loadingProfile,
        loadingMessage,
        loadingTestimoni,
      ];

  HomeState copyWith({
    Pagination? paginationNews,
    List<NewsModel>? news,
    List<BannerModel>? banners,
    List<TestimoniData>? testimoni,
    ProfileModel? profile,
    MessageHomeModel? message,
    bool? loadingBanner,
    bool? loadingNew,
    bool? loadingProfile,
    bool? loadingMessage,
    bool? loadingTestimoni,
  }) {
    return HomeState(
      paginationNews: paginationNews ?? this.paginationNews,
      news: news ?? this.news,
      profile: profile ?? this.profile,
      message: message ?? this.message,
      testimoni: testimoni ?? this.testimoni,
      banners: banners ?? this.banners,
      loadingBanner: loadingBanner ?? this.loadingBanner,
      loadingNew: loadingNew ?? this.loadingNew,
      loadingProfile: loadingProfile ?? this.loadingProfile,
      loadingMessage: loadingMessage ?? this.loadingMessage,
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
