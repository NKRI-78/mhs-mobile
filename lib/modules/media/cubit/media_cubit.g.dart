// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaState _$MediaStateFromJson(Map<String, dynamic> json) => MediaState(
      media: (json['media'] as List<dynamic>?)
              ?.map((e) => MediaData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextPageMedia: json['nextPageMedia'] as int? ?? 1,
      loadingMedia: json['loadingMedia'] as bool? ?? false,
    );

Map<String, dynamic> _$MediaStateToJson(MediaState instance) =>
    <String, dynamic>{
      'media': instance.media,
      'nextPageMedia': instance.nextPageMedia,
      'loadingMedia': instance.loadingMedia,
    };
