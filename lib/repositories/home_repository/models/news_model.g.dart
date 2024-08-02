// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
//       id: json['id'] as int?,
//       title: json['title'] as String?,
//       description: json['description'] as String?,
//       link: json['link'] as String?,
//       imageUrl: json['imageUrl'] as String?,
//       createdAt: json['createdAt'] as String?,
//       updatedAt: json['updatedAt'] as String?,
//       userId: json['userId'] as int?,
//       user: json['user'] == null
//           ? null
//           : User.fromJson(json['user'] as Map<String, dynamic>),
//     );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'link': instance.link,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userId': instance.userId,
      'user': instance.user,
    };
