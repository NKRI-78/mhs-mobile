// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_presentation_cubit.dart';

@JsonSerializable()
final class ListPresentationState extends Equatable {
  final List<DocumentData> document;
  final int nextPageNews;
  final Pagination? presentationPagination;
  final bool loadingModul;

  const ListPresentationState({
    this.document = const [],
    this.nextPageNews = 1,
    this.presentationPagination,
    this.loadingModul = false,
  });

  @override
  List<Object?> get props => [
        document,
        nextPageNews,
        presentationPagination,
        loadingModul
      ];

  ListPresentationState copyWith({
    List<DocumentData>? document,
    int? nextPageNews,
    Pagination? presentationPagination,
    bool? loadingModul,
  }) {
    return ListPresentationState(
      document: document ?? this.document,
      nextPageNews: nextPageNews ?? this.nextPageNews,
      presentationPagination: presentationPagination ?? this.presentationPagination,
      loadingModul: loadingModul ?? this.loadingModul,
    );
  }
}
