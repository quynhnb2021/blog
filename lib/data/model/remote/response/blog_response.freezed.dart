// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'blog_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlogResponse _$BlogResponseFromJson(Map<String, dynamic> json) {
  return _BlogResponse.fromJson(json);
}

/// @nodoc
mixin _$BlogResponse {
  @JsonKey(name: 'authorName')
  String get authorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'desc')
  String get desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'imgUrl')
  String get imgUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogResponseCopyWith<BlogResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogResponseCopyWith<$Res> {
  factory $BlogResponseCopyWith(
          BlogResponse value, $Res Function(BlogResponse) then) =
      _$BlogResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'authorName') String authorName,
      @JsonKey(name: 'desc') String desc,
      @JsonKey(name: 'imgUrl') String imgUrl,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'type') String type});
}

/// @nodoc
class _$BlogResponseCopyWithImpl<$Res> implements $BlogResponseCopyWith<$Res> {
  _$BlogResponseCopyWithImpl(this._value, this._then);

  final BlogResponse _value;
  // ignore: unused_field
  final $Res Function(BlogResponse) _then;

  @override
  $Res call({
    Object? authorName = freezed,
    Object? desc = freezed,
    Object? imgUrl = freezed,
    Object? title = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BlogResponseCopyWith<$Res>
    implements $BlogResponseCopyWith<$Res> {
  factory _$$_BlogResponseCopyWith(
          _$_BlogResponse value, $Res Function(_$_BlogResponse) then) =
      __$$_BlogResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'authorName') String authorName,
      @JsonKey(name: 'desc') String desc,
      @JsonKey(name: 'imgUrl') String imgUrl,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'type') String type});
}

/// @nodoc
class __$$_BlogResponseCopyWithImpl<$Res>
    extends _$BlogResponseCopyWithImpl<$Res>
    implements _$$_BlogResponseCopyWith<$Res> {
  __$$_BlogResponseCopyWithImpl(
      _$_BlogResponse _value, $Res Function(_$_BlogResponse) _then)
      : super(_value, (v) => _then(v as _$_BlogResponse));

  @override
  _$_BlogResponse get _value => super._value as _$_BlogResponse;

  @override
  $Res call({
    Object? authorName = freezed,
    Object? desc = freezed,
    Object? imgUrl = freezed,
    Object? title = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_BlogResponse(
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BlogResponse implements _BlogResponse {
  const _$_BlogResponse(
      {@JsonKey(name: 'authorName') this.authorName = '',
      @JsonKey(name: 'desc') this.desc = '',
      @JsonKey(name: 'imgUrl') this.imgUrl = '',
      @JsonKey(name: 'title') this.title = '',
      @JsonKey(name: 'type') this.type = ''});

  factory _$_BlogResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BlogResponseFromJson(json);

  @override
  @JsonKey(name: 'authorName')
  final String authorName;
  @override
  @JsonKey(name: 'desc')
  final String desc;
  @override
  @JsonKey(name: 'imgUrl')
  final String imgUrl;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'type')
  final String type;

  @override
  String toString() {
    return 'BlogResponse(authorName: $authorName, desc: $desc, imgUrl: $imgUrl, title: $title, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlogResponse &&
            const DeepCollectionEquality()
                .equals(other.authorName, authorName) &&
            const DeepCollectionEquality().equals(other.desc, desc) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authorName),
      const DeepCollectionEquality().hash(desc),
      const DeepCollectionEquality().hash(imgUrl),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_BlogResponseCopyWith<_$_BlogResponse> get copyWith =>
      __$$_BlogResponseCopyWithImpl<_$_BlogResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BlogResponseToJson(
      this,
    );
  }
}

abstract class _BlogResponse implements BlogResponse {
  const factory _BlogResponse(
      {@JsonKey(name: 'authorName') final String authorName,
      @JsonKey(name: 'desc') final String desc,
      @JsonKey(name: 'imgUrl') final String imgUrl,
      @JsonKey(name: 'title') final String title,
      @JsonKey(name: 'type') final String type}) = _$_BlogResponse;

  factory _BlogResponse.fromJson(Map<String, dynamic> json) =
      _$_BlogResponse.fromJson;

  @override
  @JsonKey(name: 'authorName')
  String get authorName;
  @override
  @JsonKey(name: 'desc')
  String get desc;
  @override
  @JsonKey(name: 'imgUrl')
  String get imgUrl;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_BlogResponseCopyWith<_$_BlogResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
