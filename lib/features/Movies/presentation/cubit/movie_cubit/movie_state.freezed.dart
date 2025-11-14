// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieState()';
}


}

/// @nodoc
class $MovieStateCopyWith<$Res>  {
$MovieStateCopyWith(MovieState _, $Res Function(MovieState) __);
}


/// Adds pattern-matching-related methods to [MovieState].
extension MovieStatePatterns on MovieState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _NowPlayingMovies value)?  getUpcomingMovies,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _NowPlayingMovies() when getUpcomingMovies != null:
return getUpcomingMovies(_that);case _Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _NowPlayingMovies value)  getUpcomingMovies,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _NowPlayingMovies():
return getUpcomingMovies(_that);case _Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _NowPlayingMovies value)?  getUpcomingMovies,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _NowPlayingMovies() when getUpcomingMovies != null:
return getUpcomingMovies(_that);case _Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<MoviesModel> nowPlayingMovies)?  getUpcomingMovies,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _NowPlayingMovies() when getUpcomingMovies != null:
return getUpcomingMovies(_that.nowPlayingMovies);case _Error() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<MoviesModel> nowPlayingMovies)  getUpcomingMovies,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _NowPlayingMovies():
return getUpcomingMovies(_that.nowPlayingMovies);case _Error():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<MoviesModel> nowPlayingMovies)?  getUpcomingMovies,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _NowPlayingMovies() when getUpcomingMovies != null:
return getUpcomingMovies(_that.nowPlayingMovies);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements MovieState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieState.initial()';
}


}




/// @nodoc


class _Loading implements MovieState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieState.loading()';
}


}




/// @nodoc


class _NowPlayingMovies implements MovieState {
  const _NowPlayingMovies(final  List<MoviesModel> nowPlayingMovies): _nowPlayingMovies = nowPlayingMovies;
  

 final  List<MoviesModel> _nowPlayingMovies;
 List<MoviesModel> get nowPlayingMovies {
  if (_nowPlayingMovies is EqualUnmodifiableListView) return _nowPlayingMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nowPlayingMovies);
}


/// Create a copy of MovieState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NowPlayingMoviesCopyWith<_NowPlayingMovies> get copyWith => __$NowPlayingMoviesCopyWithImpl<_NowPlayingMovies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NowPlayingMovies&&const DeepCollectionEquality().equals(other._nowPlayingMovies, _nowPlayingMovies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nowPlayingMovies));

@override
String toString() {
  return 'MovieState.getUpcomingMovies(nowPlayingMovies: $nowPlayingMovies)';
}


}

/// @nodoc
abstract mixin class _$NowPlayingMoviesCopyWith<$Res> implements $MovieStateCopyWith<$Res> {
  factory _$NowPlayingMoviesCopyWith(_NowPlayingMovies value, $Res Function(_NowPlayingMovies) _then) = __$NowPlayingMoviesCopyWithImpl;
@useResult
$Res call({
 List<MoviesModel> nowPlayingMovies
});




}
/// @nodoc
class __$NowPlayingMoviesCopyWithImpl<$Res>
    implements _$NowPlayingMoviesCopyWith<$Res> {
  __$NowPlayingMoviesCopyWithImpl(this._self, this._then);

  final _NowPlayingMovies _self;
  final $Res Function(_NowPlayingMovies) _then;

/// Create a copy of MovieState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nowPlayingMovies = null,}) {
  return _then(_NowPlayingMovies(
null == nowPlayingMovies ? _self._nowPlayingMovies : nowPlayingMovies // ignore: cast_nullable_to_non_nullable
as List<MoviesModel>,
  ));
}


}

/// @nodoc


class _Error implements MovieState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of MovieState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MovieState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $MovieStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of MovieState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
