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
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int userId, int page, int pageSize)
        loadReputationHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int userId, int page, int pageSize)?
        loadReputationHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int userId, int page, int pageSize)? loadReputationHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReputationHistoryEvent value)
        loadReputationHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReputationHistoryEvent value)? loadReputationHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReputationHistoryEvent value)? loadReputationHistory,
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
  $Res call({int userId, int page, int pageSize});
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
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadReputationHistoryEventImplCopyWith<$Res>
    implements $ReputationEventCopyWith<$Res> {
  factory _$$LoadReputationHistoryEventImplCopyWith(
          _$LoadReputationHistoryEventImpl value,
          $Res Function(_$LoadReputationHistoryEventImpl) then) =
      __$$LoadReputationHistoryEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int page, int pageSize});
}

/// @nodoc
class __$$LoadReputationHistoryEventImplCopyWithImpl<$Res>
    extends _$ReputationEventCopyWithImpl<$Res,
        _$LoadReputationHistoryEventImpl>
    implements _$$LoadReputationHistoryEventImplCopyWith<$Res> {
  __$$LoadReputationHistoryEventImplCopyWithImpl(
      _$LoadReputationHistoryEventImpl _value,
      $Res Function(_$LoadReputationHistoryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_$LoadReputationHistoryEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadReputationHistoryEventImpl implements _LoadReputationHistoryEvent {
  const _$LoadReputationHistoryEventImpl(
      {required this.userId, this.page = 1, this.pageSize = 30});

  @override
  final int userId;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;

  @override
  String toString() {
    return 'ReputationEvent.loadReputationHistory(userId: $userId, page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadReputationHistoryEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, page, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadReputationHistoryEventImplCopyWith<_$LoadReputationHistoryEventImpl>
      get copyWith => __$$LoadReputationHistoryEventImplCopyWithImpl<
          _$LoadReputationHistoryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int userId, int page, int pageSize)
        loadReputationHistory,
  }) {
    return loadReputationHistory(userId, page, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int userId, int page, int pageSize)?
        loadReputationHistory,
  }) {
    return loadReputationHistory?.call(userId, page, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int userId, int page, int pageSize)? loadReputationHistory,
    required TResult orElse(),
  }) {
    if (loadReputationHistory != null) {
      return loadReputationHistory(userId, page, pageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReputationHistoryEvent value)
        loadReputationHistory,
  }) {
    return loadReputationHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReputationHistoryEvent value)? loadReputationHistory,
  }) {
    return loadReputationHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReputationHistoryEvent value)? loadReputationHistory,
    required TResult orElse(),
  }) {
    if (loadReputationHistory != null) {
      return loadReputationHistory(this);
    }
    return orElse();
  }
}

abstract class _LoadReputationHistoryEvent implements ReputationEvent {
  const factory _LoadReputationHistoryEvent(
      {required final int userId,
      final int page,
      final int pageSize}) = _$LoadReputationHistoryEventImpl;

  @override
  int get userId;
  @override
  int get page;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$LoadReputationHistoryEventImplCopyWith<_$LoadReputationHistoryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
