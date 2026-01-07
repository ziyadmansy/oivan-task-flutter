// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reputation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReputationEvent {
  int get userId => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int userId, int pageKey, int pageSize)
        fetchNextPage,
    required TResult Function(int userId, int pageSize)
        refreshReputationHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int userId, int pageKey, int pageSize)? fetchNextPage,
    TResult? Function(int userId, int pageSize)? refreshReputationHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int userId, int pageKey, int pageSize)? fetchNextPage,
    TResult Function(int userId, int pageSize)? refreshReputationHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNextPageEvent value) fetchNextPage,
    required TResult Function(_RefreshReputationHistoryEvent value)
        refreshReputationHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNextPageEvent value)? fetchNextPage,
    TResult? Function(_RefreshReputationHistoryEvent value)?
        refreshReputationHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNextPageEvent value)? fetchNextPage,
    TResult Function(_RefreshReputationHistoryEvent value)?
        refreshReputationHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReputationEventCopyWith<ReputationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReputationEventCopyWith<$Res> {
  factory $ReputationEventCopyWith(
          ReputationEvent value, $Res Function(ReputationEvent) then) =
      _$ReputationEventCopyWithImpl<$Res, ReputationEvent>;
  @useResult
  $Res call({int userId, int pageSize});
}

/// @nodoc
class _$ReputationEventCopyWithImpl<$Res, $Val extends ReputationEvent>
    implements $ReputationEventCopyWith<$Res> {
  _$ReputationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchNextPageEventImplCopyWith<$Res>
    implements $ReputationEventCopyWith<$Res> {
  factory _$$FetchNextPageEventImplCopyWith(_$FetchNextPageEventImpl value,
          $Res Function(_$FetchNextPageEventImpl) then) =
      __$$FetchNextPageEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int pageKey, int pageSize});
}

/// @nodoc
class __$$FetchNextPageEventImplCopyWithImpl<$Res>
    extends _$ReputationEventCopyWithImpl<$Res, _$FetchNextPageEventImpl>
    implements _$$FetchNextPageEventImplCopyWith<$Res> {
  __$$FetchNextPageEventImplCopyWithImpl(_$FetchNextPageEventImpl _value,
      $Res Function(_$FetchNextPageEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? pageKey = null,
    Object? pageSize = null,
  }) {
    return _then(_$FetchNextPageEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      pageKey: null == pageKey
          ? _value.pageKey
          : pageKey // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchNextPageEventImpl implements _FetchNextPageEvent {
  const _$FetchNextPageEventImpl(
      {required this.userId, this.pageKey = 1, this.pageSize = 30});

  @override
  final int userId;
  @override
  @JsonKey()
  final int pageKey;
  @override
  @JsonKey()
  final int pageSize;

  @override
  String toString() {
    return 'ReputationEvent.fetchNextPage(userId: $userId, pageKey: $pageKey, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchNextPageEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.pageKey, pageKey) || other.pageKey == pageKey) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, pageKey, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchNextPageEventImplCopyWith<_$FetchNextPageEventImpl> get copyWith =>
      __$$FetchNextPageEventImplCopyWithImpl<_$FetchNextPageEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int userId, int pageKey, int pageSize)
        fetchNextPage,
    required TResult Function(int userId, int pageSize)
        refreshReputationHistory,
  }) {
    return fetchNextPage(userId, pageKey, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int userId, int pageKey, int pageSize)? fetchNextPage,
    TResult? Function(int userId, int pageSize)? refreshReputationHistory,
  }) {
    return fetchNextPage?.call(userId, pageKey, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int userId, int pageKey, int pageSize)? fetchNextPage,
    TResult Function(int userId, int pageSize)? refreshReputationHistory,
    required TResult orElse(),
  }) {
    if (fetchNextPage != null) {
      return fetchNextPage(userId, pageKey, pageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNextPageEvent value) fetchNextPage,
    required TResult Function(_RefreshReputationHistoryEvent value)
        refreshReputationHistory,
  }) {
    return fetchNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNextPageEvent value)? fetchNextPage,
    TResult? Function(_RefreshReputationHistoryEvent value)?
        refreshReputationHistory,
  }) {
    return fetchNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNextPageEvent value)? fetchNextPage,
    TResult Function(_RefreshReputationHistoryEvent value)?
        refreshReputationHistory,
    required TResult orElse(),
  }) {
    if (fetchNextPage != null) {
      return fetchNextPage(this);
    }
    return orElse();
  }
}

abstract class _FetchNextPageEvent implements ReputationEvent {
  const factory _FetchNextPageEvent(
      {required final int userId,
      final int pageKey,
      final int pageSize}) = _$FetchNextPageEventImpl;

  @override
  int get userId;
  int get pageKey;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$FetchNextPageEventImplCopyWith<_$FetchNextPageEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshReputationHistoryEventImplCopyWith<$Res>
    implements $ReputationEventCopyWith<$Res> {
  factory _$$RefreshReputationHistoryEventImplCopyWith(
          _$RefreshReputationHistoryEventImpl value,
          $Res Function(_$RefreshReputationHistoryEventImpl) then) =
      __$$RefreshReputationHistoryEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int pageSize});
}

/// @nodoc
class __$$RefreshReputationHistoryEventImplCopyWithImpl<$Res>
    extends _$ReputationEventCopyWithImpl<$Res,
        _$RefreshReputationHistoryEventImpl>
    implements _$$RefreshReputationHistoryEventImplCopyWith<$Res> {
  __$$RefreshReputationHistoryEventImplCopyWithImpl(
      _$RefreshReputationHistoryEventImpl _value,
      $Res Function(_$RefreshReputationHistoryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? pageSize = null,
  }) {
    return _then(_$RefreshReputationHistoryEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RefreshReputationHistoryEventImpl
    implements _RefreshReputationHistoryEvent {
  const _$RefreshReputationHistoryEventImpl(
      {required this.userId, this.pageSize = 30});

  @override
  final int userId;
  @override
  @JsonKey()
  final int pageSize;

  @override
  String toString() {
    return 'ReputationEvent.refreshReputationHistory(userId: $userId, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshReputationHistoryEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshReputationHistoryEventImplCopyWith<
          _$RefreshReputationHistoryEventImpl>
      get copyWith => __$$RefreshReputationHistoryEventImplCopyWithImpl<
          _$RefreshReputationHistoryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int userId, int pageKey, int pageSize)
        fetchNextPage,
    required TResult Function(int userId, int pageSize)
        refreshReputationHistory,
  }) {
    return refreshReputationHistory(userId, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int userId, int pageKey, int pageSize)? fetchNextPage,
    TResult? Function(int userId, int pageSize)? refreshReputationHistory,
  }) {
    return refreshReputationHistory?.call(userId, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int userId, int pageKey, int pageSize)? fetchNextPage,
    TResult Function(int userId, int pageSize)? refreshReputationHistory,
    required TResult orElse(),
  }) {
    if (refreshReputationHistory != null) {
      return refreshReputationHistory(userId, pageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNextPageEvent value) fetchNextPage,
    required TResult Function(_RefreshReputationHistoryEvent value)
        refreshReputationHistory,
  }) {
    return refreshReputationHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNextPageEvent value)? fetchNextPage,
    TResult? Function(_RefreshReputationHistoryEvent value)?
        refreshReputationHistory,
  }) {
    return refreshReputationHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNextPageEvent value)? fetchNextPage,
    TResult Function(_RefreshReputationHistoryEvent value)?
        refreshReputationHistory,
    required TResult orElse(),
  }) {
    if (refreshReputationHistory != null) {
      return refreshReputationHistory(this);
    }
    return orElse();
  }
}

abstract class _RefreshReputationHistoryEvent implements ReputationEvent {
  const factory _RefreshReputationHistoryEvent(
      {required final int userId,
      final int pageSize}) = _$RefreshReputationHistoryEventImpl;

  @override
  int get userId;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$RefreshReputationHistoryEventImplCopyWith<
          _$RefreshReputationHistoryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
