// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String? get profileImage => throw _privateConstructorUsedError;
  int get reputation => throw _privateConstructorUsedError;
  @JsonKey(name: 'badge_counts')
  BadgeCountsModel? get badgeCounts => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'website_url')
  String? get websiteUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'profile_image') String? profileImage,
      int reputation,
      @JsonKey(name: 'badge_counts') BadgeCountsModel? badgeCounts,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'website_url') String? websiteUrl});

  $BadgeCountsModelCopyWith<$Res>? get badgeCounts;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? displayName = null,
    Object? profileImage = freezed,
    Object? reputation = null,
    Object? badgeCounts = freezed,
    Object? location = freezed,
    Object? websiteUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      reputation: null == reputation
          ? _value.reputation
          : reputation // ignore: cast_nullable_to_non_nullable
              as int,
      badgeCounts: freezed == badgeCounts
          ? _value.badgeCounts
          : badgeCounts // ignore: cast_nullable_to_non_nullable
              as BadgeCountsModel?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BadgeCountsModelCopyWith<$Res>? get badgeCounts {
    if (_value.badgeCounts == null) {
      return null;
    }

    return $BadgeCountsModelCopyWith<$Res>(_value.badgeCounts!, (value) {
      return _then(_value.copyWith(badgeCounts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'profile_image') String? profileImage,
      int reputation,
      @JsonKey(name: 'badge_counts') BadgeCountsModel? badgeCounts,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'website_url') String? websiteUrl});

  @override
  $BadgeCountsModelCopyWith<$Res>? get badgeCounts;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? displayName = null,
    Object? profileImage = freezed,
    Object? reputation = null,
    Object? badgeCounts = freezed,
    Object? location = freezed,
    Object? websiteUrl = freezed,
  }) {
    return _then(_$UserModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      reputation: null == reputation
          ? _value.reputation
          : reputation // ignore: cast_nullable_to_non_nullable
              as int,
      badgeCounts: freezed == badgeCounts
          ? _value.badgeCounts
          : badgeCounts // ignore: cast_nullable_to_non_nullable
              as BadgeCountsModel?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'display_name') required this.displayName,
      @JsonKey(name: 'profile_image') this.profileImage,
      required this.reputation,
      @JsonKey(name: 'badge_counts') this.badgeCounts,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'website_url') this.websiteUrl});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @override
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  final int reputation;
  @override
  @JsonKey(name: 'badge_counts')
  final BadgeCountsModel? badgeCounts;
  @override
  @JsonKey(name: 'location')
  final String? location;
  @override
  @JsonKey(name: 'website_url')
  final String? websiteUrl;

  @override
  String toString() {
    return 'UserModel(userId: $userId, displayName: $displayName, profileImage: $profileImage, reputation: $reputation, badgeCounts: $badgeCounts, location: $location, websiteUrl: $websiteUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.reputation, reputation) ||
                other.reputation == reputation) &&
            (identical(other.badgeCounts, badgeCounts) ||
                other.badgeCounts == badgeCounts) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, displayName,
      profileImage, reputation, badgeCounts, location, websiteUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
          {@JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'display_name') required final String displayName,
          @JsonKey(name: 'profile_image') final String? profileImage,
          required final int reputation,
          @JsonKey(name: 'badge_counts') final BadgeCountsModel? badgeCounts,
          @JsonKey(name: 'location') final String? location,
          @JsonKey(name: 'website_url') final String? websiteUrl}) =
      _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'display_name')
  String get displayName;
  @override
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @override
  int get reputation;
  @override
  @JsonKey(name: 'badge_counts')
  BadgeCountsModel? get badgeCounts;
  @override
  @JsonKey(name: 'location')
  String? get location;
  @override
  @JsonKey(name: 'website_url')
  String? get websiteUrl;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
