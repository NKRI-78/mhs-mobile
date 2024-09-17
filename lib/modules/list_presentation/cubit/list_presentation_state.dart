// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_presentation_cubit.dart';

@JsonSerializable()
final class ListPresentationState extends Equatable {
  final List<DocumentData> document;
  final int nextPageNews;
  final Pagination? presentationPagination;
  final bool loadingPresentation;

  const ListPresentationState({
    this.document = const [],
    this.nextPageNews = 1,
    this.presentationPagination,
    this.loadingPresentation = false,
  });

  List<GalleryItemModel> get presentationImage => document.map((e) => GalleryItemModel(id: e.id.toString(), imageUrl: e.fileUrl ?? "", index: document.indexOf(e), title: e.title ?? "")).toList();

  @override
  List<Object?> get props => [
    document,
    nextPageNews,
    presentationPagination,
    loadingPresentation
  ];

  ListPresentationState copyWith({
    List<DocumentData>? document,
    int? nextPageNews,
    Pagination? presentationPagination,
    bool? loadingPresentation,
  }) {
    return ListPresentationState(
      document: document ?? this.document,
      nextPageNews: nextPageNews ?? this.nextPageNews,
      presentationPagination: presentationPagination ?? this.presentationPagination,
      loadingPresentation: loadingPresentation ?? this.loadingPresentation,
    );
  }
}
