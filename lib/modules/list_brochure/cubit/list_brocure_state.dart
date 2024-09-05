// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_brocure_cubit.dart';

@JsonSerializable()
final class ListBrocureState extends Equatable {
  final List<DocumentData> document;
  final int nextPageNews;
  final Pagination? newsPagination;
  final bool loadingBrocuhure;

  const ListBrocureState({
    this.document = const [],
    this.nextPageNews = 1,
    this.newsPagination,
    this.loadingBrocuhure = false,
  });

  @override
  List<Object?> get props => [
        document,
        nextPageNews,
        newsPagination,
        loadingBrocuhure
      ];
  
  List<GalleryItemModel> get presentationImage => document.map((e) => GalleryItemModel(id: e.id.toString(), imageUrl: e.fileUrl ?? "", index: document.indexOf(e), title: e.title ?? "")).toList();

  ListBrocureState copyWith({
    List<DocumentData>? document,
    int? nextPageNews,
    Pagination? newsPagination,
    bool? loadingBrocuhure,
  }) {
    return ListBrocureState(
      document: document ?? this.document,
      nextPageNews: nextPageNews ?? this.nextPageNews,
      newsPagination: newsPagination ?? this.newsPagination,
      loadingBrocuhure: loadingBrocuhure ?? this.loadingBrocuhure,
    );
  }
}
