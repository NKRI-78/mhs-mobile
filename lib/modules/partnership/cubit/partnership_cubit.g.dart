// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partnership_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnershipState _$PartnershipStateFromJson(Map<String, dynamic> json) =>
    PartnershipState(
      partnership: (json['partnership'] as List<dynamic>?)
              ?.map((e) => PartnershipData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextPagePartnership: json['nextPagePartnership'] as int? ?? 1,
      loadingModul: json['loadingModul'] as bool? ?? false,
    );

Map<String, dynamic> _$PartnershipStateToJson(PartnershipState instance) =>
    <String, dynamic>{
      'partnership': instance.partnership,
      'nextPagePartnership': instance.nextPagePartnership,
      'loadingModul': instance.loadingModul,
    };
