// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'show_more_news_cubit.dart';

@JsonSerializable()
final class ShowMoreNewsState extends Equatable {
  final List<NewsModel> news;
  final int nextPageNews;
  final Pagination? newsPagination;
  final bool loadingNews;

  const ShowMoreNewsState({
    this.news = const [],
    this.nextPageNews = 1,
    this.newsPagination,
    this.loadingNews = false,
  });

  @override
  List<Object?> get props => [
        news,
        nextPageNews,
        newsPagination,
        loadingNews
      ];

  ShowMoreNewsState copyWith({
    List<NewsModel>? news,
    int? nextPageNews,
    Pagination? newsPagination,
    bool? loadingNews,
  }) {
    return ShowMoreNewsState(
      news: news ?? this.news,
      nextPageNews: nextPageNews ?? this.nextPageNews,
      newsPagination: newsPagination ?? this.newsPagination,
      loadingNews: loadingNews ?? this.loadingNews,
    );
  }
}
