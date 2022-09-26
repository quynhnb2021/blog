// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlogResponse _$$_BlogResponseFromJson(Map<String, dynamic> json) =>
    _$_BlogResponse(
      authorName: json['authorName'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      imgUrl: json['imgUrl'] as String? ?? '',
      title: json['title'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$_BlogResponseToJson(_$_BlogResponse instance) =>
    <String, dynamic>{
      'authorName': instance.authorName,
      'desc': instance.desc,
      'imgUrl': instance.imgUrl,
      'title': instance.title,
      'type': instance.type,
    };
