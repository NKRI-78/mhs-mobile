// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_modul_cubit.dart';

@JsonSerializable()
final class ListModulState extends Equatable {
  final List<DocumentData> document;
  final int nextPageNews;
  final Pagination? newsPagination;
  final bool loadingModul;

  const ListModulState({
    this.document = const [],
    this.nextPageNews = 1,
    this.newsPagination,
    this.loadingModul = false,
  });

  @override
  List<Object?> get props => [
        document,
        nextPageNews,
        newsPagination,
        loadingModul
      ];

  ListModulState copyWith({
    List<DocumentData>? document,
    int? nextPageNews,
    Pagination? newsPagination,
    bool? loadingModul,
  }) {
    return ListModulState(
      document: document ?? this.document,
      nextPageNews: nextPageNews ?? this.nextPageNews,
      newsPagination: newsPagination ?? this.newsPagination,
      loadingModul: loadingModul ?? this.loadingModul,
    );
  }
}
