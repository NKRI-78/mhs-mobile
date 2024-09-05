part of 'show_more_testimoni_cubit.dart';

@JsonSerializable()
final class ShowMoreTestimoniState extends Equatable {
  final List<TestimoniData> testimoni;
  final int nextPageTestimoni;
  final Pagination? tstimoniPagination;
  final bool loadingTestimoni;

  const ShowMoreTestimoniState({
    this.testimoni = const [],
    this.nextPageTestimoni = 1,
    this.tstimoniPagination,
    this.loadingTestimoni = false,
  });

  List<Object?> get props => [
        testimoni,
        nextPageTestimoni,
        tstimoniPagination,
        loadingTestimoni
      ];

  ShowMoreTestimoniState copyWith({
    List<TestimoniData>? testimoni,
    int? nextPageTestimoni,
    Pagination? tstimoniPagination,
    bool? loadingTestimoni,
  }) {
    return ShowMoreTestimoniState(
      testimoni: testimoni ?? this.testimoni,
      nextPageTestimoni: nextPageTestimoni ?? this.nextPageTestimoni,
      tstimoniPagination: tstimoniPagination ?? this.tstimoniPagination,
      loadingTestimoni: loadingTestimoni ?? this.loadingTestimoni,
    );
  }
}