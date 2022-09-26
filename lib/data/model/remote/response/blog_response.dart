// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_response.freezed.dart';
part 'blog_response.g.dart';

@freezed
class BlogResponse with _$BlogResponse {
  const factory BlogResponse({
    @JsonKey(name: 'authorName') @Default('') String authorName,
    @JsonKey(name: 'desc') @Default('') String desc,
    @JsonKey(name: 'imgUrl') @Default('') String imgUrl,
    @JsonKey(name: 'title') @Default('') String title,
    @JsonKey(name: 'type') @Default('') String type,
  }) = _BlogResponse;

  factory BlogResponse.fromJson(Map<String, dynamic> json) =>
      _$BlogResponseFromJson(json);
}
