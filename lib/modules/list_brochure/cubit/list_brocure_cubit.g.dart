// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_brocure_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBrocureState _$ListBrocureStateFromJson(Map<String, dynamic> json) =>
    ListBrocureState(
      document: (json['document'] as List<dynamic>?)
              ?.map((e) => DocumentData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextPageNews: json['nextPageNews'] as int? ?? 1,
      newsPagination: json['newsPagination'] == null
          ? null
          : Pagination.fromJson(json['newsPagination'] as Map<String, dynamic>),
      loadingBrocuhure: json['loadingBrocuhure'] as bool? ?? false,
    );

Map<String, dynamic> _$ListBrocureStateToJson(ListBrocureState instance) =>
    <String, dynamic>{
      'document': instance.document,
      'nextPageNews': instance.nextPageNews,
      'newsPagination': instance.newsPagination,
      'loadingBrocuhure': instance.loadingBrocuhure,
    };
