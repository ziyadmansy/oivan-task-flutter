// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reputation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReputationModel _$ReputationModelFromJson(Map<String, dynamic> json) {
  return _ReputationModel.fromJson(json);
}

/// @nodoc
mixin _$ReputationModel {
  @JsonKey(name: 'reputation_history_id')
  int get reputationHistoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'reputation_type')
  String get reputationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'reputation_change')
  int get reputationChange => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation_date')
  int get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_id')
  int? get postId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReputationModelCopyWith<ReputationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReputationModelCopyWith<$Res> {
  factory $ReputationModelCopyWith(
          ReputationModel value, $Res Function(ReputationModel) then) =
      _$ReputationModelCopyWithImpl<$Res, ReputationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reputation_history_id') int reputationHistoryId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'reputation_type') String reputationType,
      @JsonKey(name: 'reputation_change') int reputationChange,
      @JsonKey(name: 'creation_date') int creationDate,
      @JsonKey(name: 'post_id') int? postId});
}

/// @nodoc
class _$ReputationModelCopyWithImpl<$Res, $Val extends ReputationModel>
    implements $ReputationModelCopyWith<$Res> {
  _$ReputationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reputationHistoryId = null,
    Object? userId = null,
    Object? reputationType = null,
    Object? reputationChange = null,
    Object? creationDate = null,
    Object? postId = freezed,
  }) {
    return _then(_value.copyWith(
      reputationHistoryId: null == reputationHistoryId
          ? _value.reputationHistoryId
          : reputationHistoryId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      reputationType: null == reputationType
          ? _value.reputationType
          : reputationType // ignore: cast_nullable_to_non_nullable
              as String,
      reputationChange: null == reputationChange
          ? _value.reputationChange
          : reputationChange // ignore: cast_nullable_to_non_nullable
              as int,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as int,
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReputationModelImplCopyWith<$Res>
    implements $ReputationModelCopyWith<$Res> {
  factory _$$ReputationModelImplCopyWith(_$ReputationModelImpl value,
          $Res Function(_$ReputationModelImpl) then) =
      __$$ReputationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reputation_history_id') int reputationHistoryId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'reputation_type') String reputationType,
      @JsonKey(name: 'reputation_change') int reputationChange,
      @JsonKey(name: 'creation_date') int creationDate,
      @JsonKey(name: 'post_id') int? postId});
}

/// @nodoc
class __$$ReputationModelImplCopyWithImpl<$Res>
    extends _$ReputationModelCopyWithImpl<$Res, _$ReputationModelImpl>
    implements _$$ReputationModelImplCopyWith<$Res> {
  __$$ReputationModelImplCopyWithImpl(
      _$ReputationModelImpl _value, $Res Function(_$ReputationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reputationHistoryId = null,
    Object? userId = null,
    Object? reputationType = null,
    Object? reputationChange = null,
    Object? creationDate = null,
    Object? postId = freezed,
  }) {
    return _then(_$ReputationModelImpl(
      reputationHistoryId: null == reputationHistoryId
          ? _value.reputationHistoryId
          : reputationHistoryId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      reputationType: null == reputationType
          ? _value.reputationType
          : reputationType // ignore: cast_nullable_to_non_nullable
              as String,
      reputationChange: null == reputationChange
          ? _value.reputationChange
          : reputationChange // ignore: cast_nullable_to_non_nullable
              as int,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as int,
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReputationModelImpl implements _ReputationModel {
  const _$ReputationModelImpl(
      {@JsonKey(name: 'reputation_history_id')
      required this.reputationHistoryId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'reputation_type') required this.reputationType,
      @JsonKey(name: 'reputation_change') required this.reputationChange,
      @JsonKey(name: 'creation_date') required this.creationDate,
      @JsonKey(name: 'post_id') this.postId});

  factory _$ReputationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReputationModelImplFromJson(json);

  @override
  @JsonKey(name: 'reputation_history_id')
  final int reputationHistoryId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'reputation_type')
  final String reputationType;
  @override
  @JsonKey(name: 'reputation_change')
  final int reputationChange;
  @override
  @JsonKey(name: 'creation_date')
  final int creationDate;
  @override
  @JsonKey(name: 'post_id')
  final int? postId;

  @override
  String toString() {
    return 'ReputationModel(reputationHistoryId: $reputationHistoryId, userId: $userId, reputationType: $reputationType, reputationChange: $reputationChange, creationDate: $creationDate, postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReputationModelImpl &&
            (identical(other.reputationHistoryId, reputationHistoryId) ||
                other.reputationHistoryId == reputationHistoryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.reputationType, reputationType) ||
                other.reputationType == reputationType) &&
            (identical(other.reputationChange, reputationChange) ||
                other.reputationChange == reputationChange) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reputationHistoryId, userId,
      reputationType, reputationChange, creationDate, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReputationModelImplCopyWith<_$ReputationModelImpl> get copyWith =>
      __$$ReputationModelImplCopyWithImpl<_$ReputationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReputationModelImplToJson(
      this,
    );
  }
}

abstract class _ReputationModel implements ReputationModel {
  const factory _ReputationModel(
      {@JsonKey(name: 'reputation_history_id')
      required final int reputationHistoryId,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'reputation_type') required final String reputationType,
      @JsonKey(name: 'reputation_change') required final int reputationChange,
      @JsonKey(name: 'creation_date') required final int creationDate,
      @JsonKey(name: 'post_id') final int? postId}) = _$ReputationModelImpl;

  factory _ReputationModel.fromJson(Map<String, dynamic> json) =
      _$ReputationModelImpl.fromJson;

  @override
  @JsonKey(name: 'reputation_history_id')
  int get reputationHistoryId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'reputation_type')
  String get reputationType;
  @override
  @JsonKey(name: 'reputation_change')
  int get reputationChange;
  @override
  @JsonKey(name: 'creation_date')
  int get creationDate;
  @override
  @JsonKey(name: 'post_id')
  int? get postId;
  @override
  @JsonKey(ignore: true)
  _$$ReputationModelImplCopyWith<_$ReputationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
