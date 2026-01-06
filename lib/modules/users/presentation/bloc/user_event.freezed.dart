// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int pageSize) loadUsers,
    required TResult Function() loadBookmarkedUsers,
    required TResult Function(UserEntity user) toggleBookmark,
    required TResult Function(bool showOnlyBookmarked) filterByBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int pageSize)? loadUsers,
    TResult? Function()? loadBookmarkedUsers,
    TResult? Function(UserEntity user)? toggleBookmark,
    TResult? Function(bool showOnlyBookmarked)? filterByBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int pageSize)? loadUsers,
    TResult Function()? loadBookmarkedUsers,
    TResult Function(UserEntity user)? toggleBookmark,
    TResult Function(bool showOnlyBookmarked)? filterByBookmark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsersEvent value) loadUsers,
    required TResult Function(_LoadBookmarkedUsersEvent value)
        loadBookmarkedUsers,
    required TResult Function(_ToggleBookmarkEvent value) toggleBookmark,
    required TResult Function(_FilterByBookmarkEvent value) filterByBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsersEvent value)? loadUsers,
    TResult? Function(_LoadBookmarkedUsersEvent value)? loadBookmarkedUsers,
    TResult? Function(_ToggleBookmarkEvent value)? toggleBookmark,
    TResult? Function(_FilterByBookmarkEvent value)? filterByBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsersEvent value)? loadUsers,
    TResult Function(_LoadBookmarkedUsersEvent value)? loadBookmarkedUsers,
    TResult Function(_ToggleBookmarkEvent value)? toggleBookmark,
    TResult Function(_FilterByBookmarkEvent value)? filterByBookmark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadUsersEventImplCopyWith<$Res> {
  factory _$$LoadUsersEventImplCopyWith(_$LoadUsersEventImpl value,
          $Res Function(_$LoadUsersEventImpl) then) =
      __$$LoadUsersEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int pageSize});
}

/// @nodoc
class __$$LoadUsersEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$LoadUsersEventImpl>
    implements _$$LoadUsersEventImplCopyWith<$Res> {
  __$$LoadUsersEventImplCopyWithImpl(
      _$LoadUsersEventImpl _value, $Res Function(_$LoadUsersEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_$LoadUsersEventImpl(
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

class _$LoadUsersEventImpl implements _LoadUsersEvent {
  const _$LoadUsersEventImpl({this.page = 1, this.pageSize = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;

  @override
  String toString() {
    return 'UserEvent.loadUsers(page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUsersEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadUsersEventImplCopyWith<_$LoadUsersEventImpl> get copyWith =>
      __$$LoadUsersEventImplCopyWithImpl<_$LoadUsersEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int pageSize) loadUsers,
    required TResult Function() loadBookmarkedUsers,
    required TResult Function(UserEntity user) toggleBookmark,
    required TResult Function(bool showOnlyBookmarked) filterByBookmark,
  }) {
    return loadUsers(page, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int pageSize)? loadUsers,
    TResult? Function()? loadBookmarkedUsers,
    TResult? Function(UserEntity user)? toggleBookmark,
    TResult? Function(bool showOnlyBookmarked)? filterByBookmark,
  }) {
    return loadUsers?.call(page, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int pageSize)? loadUsers,
    TResult Function()? loadBookmarkedUsers,
    TResult Function(UserEntity user)? toggleBookmark,
    TResult Function(bool showOnlyBookmarked)? filterByBookmark,
    required TResult orElse(),
  }) {
    if (loadUsers != null) {
      return loadUsers(page, pageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsersEvent value) loadUsers,
    required TResult Function(_LoadBookmarkedUsersEvent value)
        loadBookmarkedUsers,
    required TResult Function(_ToggleBookmarkEvent value) toggleBookmark,
    required TResult Function(_FilterByBookmarkEvent value) filterByBookmark,
  }) {
    return loadUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsersEvent value)? loadUsers,
    TResult? Function(_LoadBookmarkedUsersEvent value)? loadBookmarkedUsers,
    TResult? Function(_ToggleBookmarkEvent value)? toggleBookmark,
    TResult? Function(_FilterByBookmarkEvent value)? filterByBookmark,
  }) {
    return loadUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsersEvent value)? loadUsers,
    TResult Function(_LoadBookmarkedUsersEvent value)? loadBookmarkedUsers,
    TResult Function(_ToggleBookmarkEvent value)? toggleBookmark,
    TResult Function(_FilterByBookmarkEvent value)? filterByBookmark,
    required TResult orElse(),
  }) {
    if (loadUsers != null) {
      return loadUsers(this);
    }
    return orElse();
  }
}

abstract class _LoadUsersEvent implements UserEvent {
  const factory _LoadUsersEvent({final int page, final int pageSize}) =
      _$LoadUsersEventImpl;

  int get page;
  int get pageSize;
  @JsonKey(ignore: true)
  _$$LoadUsersEventImplCopyWith<_$LoadUsersEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadBookmarkedUsersEventImplCopyWith<$Res> {
  factory _$$LoadBookmarkedUsersEventImplCopyWith(
          _$LoadBookmarkedUsersEventImpl value,
          $Res Function(_$LoadBookmarkedUsersEventImpl) then) =
      __$$LoadBookmarkedUsersEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadBookmarkedUsersEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$LoadBookmarkedUsersEventImpl>
    implements _$$LoadBookmarkedUsersEventImplCopyWith<$Res> {
  __$$LoadBookmarkedUsersEventImplCopyWithImpl(
      _$LoadBookmarkedUsersEventImpl _value,
      $Res Function(_$LoadBookmarkedUsersEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadBookmarkedUsersEventImpl implements _LoadBookmarkedUsersEvent {
  const _$LoadBookmarkedUsersEventImpl();

  @override
  String toString() {
    return 'UserEvent.loadBookmarkedUsers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadBookmarkedUsersEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int pageSize) loadUsers,
    required TResult Function() loadBookmarkedUsers,
    required TResult Function(UserEntity user) toggleBookmark,
    required TResult Function(bool showOnlyBookmarked) filterByBookmark,
  }) {
    return loadBookmarkedUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int pageSize)? loadUsers,
    TResult? Function()? loadBookmarkedUsers,
    TResult? Function(UserEntity user)? toggleBookmark,
    TResult? Function(bool showOnlyBookmarked)? filterByBookmark,
  }) {
    return loadBookmarkedUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int pageSize)? loadUsers,
    TResult Function()? loadBookmarkedUsers,
    TResult Function(UserEntity user)? toggleBookmark,
    TResult Function(bool showOnlyBookmarked)? filterByBookmark,
    required TResult orElse(),
  }) {
    if (loadBookmarkedUsers != null) {
      return loadBookmarkedUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsersEvent value) loadUsers,
    required TResult Function(_LoadBookmarkedUsersEvent value)
        loadBookmarkedUsers,
    required TResult Function(_ToggleBookmarkEvent value) toggleBookmark,
    required TResult Function(_FilterByBookmarkEvent value) filterByBookmark,
  }) {
    return loadBookmarkedUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsersEvent value)? loadUsers,
    TResult? Function(_LoadBookmarkedUsersEvent value)? loadBookmarkedUsers,
    TResult? Function(_ToggleBookmarkEvent value)? toggleBookmark,
    TResult? Function(_FilterByBookmarkEvent value)? filterByBookmark,
  }) {
    return loadBookmarkedUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsersEvent value)? loadUsers,
    TResult Function(_LoadBookmarkedUsersEvent value)? loadBookmarkedUsers,
    TResult Function(_ToggleBookmarkEvent value)? toggleBookmark,
    TResult Function(_FilterByBookmarkEvent value)? filterByBookmark,
    required TResult orElse(),
  }) {
    if (loadBookmarkedUsers != null) {
      return loadBookmarkedUsers(this);
    }
    return orElse();
  }
}

abstract class _LoadBookmarkedUsersEvent implements UserEvent {
  const factory _LoadBookmarkedUsersEvent() = _$LoadBookmarkedUsersEventImpl;
}

/// @nodoc
abstract class _$$ToggleBookmarkEventImplCopyWith<$Res> {
  factory _$$ToggleBookmarkEventImplCopyWith(_$ToggleBookmarkEventImpl value,
          $Res Function(_$ToggleBookmarkEventImpl) then) =
      __$$ToggleBookmarkEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$ToggleBookmarkEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$ToggleBookmarkEventImpl>
    implements _$$ToggleBookmarkEventImplCopyWith<$Res> {
  __$$ToggleBookmarkEventImplCopyWithImpl(_$ToggleBookmarkEventImpl _value,
      $Res Function(_$ToggleBookmarkEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$ToggleBookmarkEventImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$ToggleBookmarkEventImpl implements _ToggleBookmarkEvent {
  const _$ToggleBookmarkEventImpl(this.user);

  @override
  final UserEntity user;

  @override
  String toString() {
    return 'UserEvent.toggleBookmark(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleBookmarkEventImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleBookmarkEventImplCopyWith<_$ToggleBookmarkEventImpl> get copyWith =>
      __$$ToggleBookmarkEventImplCopyWithImpl<_$ToggleBookmarkEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int pageSize) loadUsers,
    required TResult Function() loadBookmarkedUsers,
    required TResult Function(UserEntity user) toggleBookmark,
    required TResult Function(bool showOnlyBookmarked) filterByBookmark,
  }) {
    return toggleBookmark(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int pageSize)? loadUsers,
    TResult? Function()? loadBookmarkedUsers,
    TResult? Function(UserEntity user)? toggleBookmark,
    TResult? Function(bool showOnlyBookmarked)? filterByBookmark,
  }) {
    return toggleBookmark?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int pageSize)? loadUsers,
    TResult Function()? loadBookmarkedUsers,
    TResult Function(UserEntity user)? toggleBookmark,
    TResult Function(bool showOnlyBookmarked)? filterByBookmark,
    required TResult orElse(),
  }) {
    if (toggleBookmark != null) {
      return toggleBookmark(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsersEvent value) loadUsers,
    required TResult Function(_LoadBookmarkedUsersEvent value)
        loadBookmarkedUsers,
    required TResult Function(_ToggleBookmarkEvent value) toggleBookmark,
    required TResult Function(_FilterByBookmarkEvent value) filterByBookmark,
  }) {
    return toggleBookmark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsersEvent value)? loadUsers,
    TResult? Function(_LoadBookmarkedUsersEvent value)? loadBookmarkedUsers,
    TResult? Function(_ToggleBookmarkEvent value)? toggleBookmark,
    TResult? Function(_FilterByBookmarkEvent value)? filterByBookmark,
  }) {
    return toggleBookmark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsersEvent value)? loadUsers,
    TResult Function(_LoadBookmarkedUsersEvent value)? loadBookmarkedUsers,
    TResult Function(_ToggleBookmarkEvent value)? toggleBookmark,
    TResult Function(_FilterByBookmarkEvent value)? filterByBookmark,
    required TResult orElse(),
  }) {
    if (toggleBookmark != null) {
      return toggleBookmark(this);
    }
    return orElse();
  }
}

abstract class _ToggleBookmarkEvent implements UserEvent {
  const factory _ToggleBookmarkEvent(final UserEntity user) =
      _$ToggleBookmarkEventImpl;

  UserEntity get user;
  @JsonKey(ignore: true)
  _$$ToggleBookmarkEventImplCopyWith<_$ToggleBookmarkEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByBookmarkEventImplCopyWith<$Res> {
  factory _$$FilterByBookmarkEventImplCopyWith(
          _$FilterByBookmarkEventImpl value,
          $Res Function(_$FilterByBookmarkEventImpl) then) =
      __$$FilterByBookmarkEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool showOnlyBookmarked});
}

/// @nodoc
class __$$FilterByBookmarkEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$FilterByBookmarkEventImpl>
    implements _$$FilterByBookmarkEventImplCopyWith<$Res> {
  __$$FilterByBookmarkEventImplCopyWithImpl(_$FilterByBookmarkEventImpl _value,
      $Res Function(_$FilterByBookmarkEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showOnlyBookmarked = null,
  }) {
    return _then(_$FilterByBookmarkEventImpl(
      showOnlyBookmarked: null == showOnlyBookmarked
          ? _value.showOnlyBookmarked
          : showOnlyBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FilterByBookmarkEventImpl implements _FilterByBookmarkEvent {
  const _$FilterByBookmarkEventImpl({required this.showOnlyBookmarked});

  @override
  final bool showOnlyBookmarked;

  @override
  String toString() {
    return 'UserEvent.filterByBookmark(showOnlyBookmarked: $showOnlyBookmarked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByBookmarkEventImpl &&
            (identical(other.showOnlyBookmarked, showOnlyBookmarked) ||
                other.showOnlyBookmarked == showOnlyBookmarked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showOnlyBookmarked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByBookmarkEventImplCopyWith<_$FilterByBookmarkEventImpl>
      get copyWith => __$$FilterByBookmarkEventImplCopyWithImpl<
          _$FilterByBookmarkEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int pageSize) loadUsers,
    required TResult Function() loadBookmarkedUsers,
    required TResult Function(UserEntity user) toggleBookmark,
    required TResult Function(bool showOnlyBookmarked) filterByBookmark,
  }) {
    return filterByBookmark(showOnlyBookmarked);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int pageSize)? loadUsers,
    TResult? Function()? loadBookmarkedUsers,
    TResult? Function(UserEntity user)? toggleBookmark,
    TResult? Function(bool showOnlyBookmarked)? filterByBookmark,
  }) {
    return filterByBookmark?.call(showOnlyBookmarked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int pageSize)? loadUsers,
    TResult Function()? loadBookmarkedUsers,
    TResult Function(UserEntity user)? toggleBookmark,
    TResult Function(bool showOnlyBookmarked)? filterByBookmark,
    required TResult orElse(),
  }) {
    if (filterByBookmark != null) {
      return filterByBookmark(showOnlyBookmarked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsersEvent value) loadUsers,
    required TResult Function(_LoadBookmarkedUsersEvent value)
        loadBookmarkedUsers,
    required TResult Function(_ToggleBookmarkEvent value) toggleBookmark,
    required TResult Function(_FilterByBookmarkEvent value) filterByBookmark,
  }) {
    return filterByBookmark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsersEvent value)? loadUsers,
    TResult? Function(_LoadBookmarkedUsersEvent value)? loadBookmarkedUsers,
    TResult? Function(_ToggleBookmarkEvent value)? toggleBookmark,
    TResult? Function(_FilterByBookmarkEvent value)? filterByBookmark,
  }) {
    return filterByBookmark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsersEvent value)? loadUsers,
    TResult Function(_LoadBookmarkedUsersEvent value)? loadBookmarkedUsers,
    TResult Function(_ToggleBookmarkEvent value)? toggleBookmark,
    TResult Function(_FilterByBookmarkEvent value)? filterByBookmark,
    required TResult orElse(),
  }) {
    if (filterByBookmark != null) {
      return filterByBookmark(this);
    }
    return orElse();
  }
}

abstract class _FilterByBookmarkEvent implements UserEvent {
  const factory _FilterByBookmarkEvent(
      {required final bool showOnlyBookmarked}) = _$FilterByBookmarkEventImpl;

  bool get showOnlyBookmarked;
  @JsonKey(ignore: true)
  _$$FilterByBookmarkEventImplCopyWith<_$FilterByBookmarkEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
