// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_more_news_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowMoreNewsState _$ShowMoreNewsStateFromJson(Map<String, dynamic> json) =>
    ShowMoreNewsState(
      news: (json['news'] as List<dynamic>?)
              ?.map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextPageNews: json['nextPageNews'] as int? ?? 1,
      newsPagination: json['newsPagination'] == null
          ? null
          : Pagination.fromJson(json['newsPagination'] as Map<String, dynamic>),
      loadingNews: json['loadingNews'] as bool? ?? false,
    );

Map<String, dynamic> _$ShowMoreNewsStateToJson(ShowMoreNewsState instance) =>
    <String, dynamic>{
      'news': instance.news,
      'nextPageNews': instance.nextPageNews,
      'newsPagination': instance.newsPagination,
      'loadingNews': instance.loadingNews,
    };
