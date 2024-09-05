// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'media_cubit.dart';

@JsonSerializable()
final class MediaState extends Equatable {
  final List<MediaData> media;
  final int nextPageMedia;
  final bool loadingMedia;

  const MediaState({
    this.media = const [],
    this.nextPageMedia = 1,
    this.loadingMedia = false,
  });

  @override
  List<Object?> get props => [
        media,
        nextPageMedia,
        loadingMedia
      ];

  MediaState copyWith({
    List<MediaData>? media,
    int? nextPageMedia,
    bool? loadingMedia,
  }) {
    return MediaState(
      media: media ?? this.media,
      nextPageMedia: nextPageMedia ?? this.nextPageMedia,
      loadingMedia: loadingMedia ?? this.loadingMedia,
    );
  }
}
