// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Pagination paginationNews;
  final List<NewsModel> news;

  const HomeState({required this.paginationNews, this.news = const []});

  @override
  List<Object?> get props => [paginationNews, news];

  HomeState copyWith({
    Pagination? paginationNews,
    List<NewsModel>? news,
  }) {
    return HomeState(
      paginationNews: paginationNews ?? this.paginationNews,
      news: news ?? this.news,
    );
  }
}
