// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_presentation_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPresentationState _$ListPresentationStateFromJson(
        Map<String, dynamic> json) =>
    ListPresentationState(
      document: (json['document'] as List<dynamic>?)
              ?.map((e) => DocumentData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextPageNews: json['nextPageNews'] as int? ?? 1,
      presentationPagination: json['presentationPagination'] == null
          ? null
          : Pagination.fromJson(
              json['presentationPagination'] as Map<String, dynamic>),
      loadingPresentation: json['loadingPresentation'] as bool? ?? false,
    );

Map<String, dynamic> _$ListPresentationStateToJson(
        ListPresentationState instance) =>
    <String, dynamic>{
      'document': instance.document,
      'nextPageNews': instance.nextPageNews,
      'presentationPagination': instance.presentationPagination,
      'loadingPresentation': instance.loadingPresentation,
    };
