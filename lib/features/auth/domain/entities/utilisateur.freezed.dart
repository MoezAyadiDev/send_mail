// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'utilisateur.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Utilisateur _$UtilisateurFromJson(Map<String, dynamic> json) {
  return _Utilisateur.fromJson(json);
}

/// @nodoc
class _$UtilisateurTearOff {
  const _$UtilisateurTearOff();

  _Utilisateur call(String uid, String name, String email) {
    return _Utilisateur(
      uid,
      name,
      email,
    );
  }

  Utilisateur fromJson(Map<String, Object?> json) {
    return Utilisateur.fromJson(json);
  }
}

/// @nodoc
const $Utilisateur = _$UtilisateurTearOff();

/// @nodoc
mixin _$Utilisateur {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UtilisateurCopyWith<Utilisateur> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtilisateurCopyWith<$Res> {
  factory $UtilisateurCopyWith(
          Utilisateur value, $Res Function(Utilisateur) then) =
      _$UtilisateurCopyWithImpl<$Res>;
  $Res call({String uid, String name, String email});
}

/// @nodoc
class _$UtilisateurCopyWithImpl<$Res> implements $UtilisateurCopyWith<$Res> {
  _$UtilisateurCopyWithImpl(this._value, this._then);

  final Utilisateur _value;
  // ignore: unused_field
  final $Res Function(Utilisateur) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UtilisateurCopyWith<$Res>
    implements $UtilisateurCopyWith<$Res> {
  factory _$UtilisateurCopyWith(
          _Utilisateur value, $Res Function(_Utilisateur) then) =
      __$UtilisateurCopyWithImpl<$Res>;
  @override
  $Res call({String uid, String name, String email});
}

/// @nodoc
class __$UtilisateurCopyWithImpl<$Res> extends _$UtilisateurCopyWithImpl<$Res>
    implements _$UtilisateurCopyWith<$Res> {
  __$UtilisateurCopyWithImpl(
      _Utilisateur _value, $Res Function(_Utilisateur) _then)
      : super(_value, (v) => _then(v as _Utilisateur));

  @override
  _Utilisateur get _value => super._value as _Utilisateur;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_Utilisateur(
      uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Utilisateur implements _Utilisateur {
  _$_Utilisateur(this.uid, this.name, this.email);

  factory _$_Utilisateur.fromJson(Map<String, dynamic> json) =>
      _$$_UtilisateurFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'Utilisateur(uid: $uid, name: $name, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Utilisateur &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$UtilisateurCopyWith<_Utilisateur> get copyWith =>
      __$UtilisateurCopyWithImpl<_Utilisateur>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UtilisateurToJson(this);
  }
}

abstract class _Utilisateur implements Utilisateur {
  factory _Utilisateur(String uid, String name, String email) = _$_Utilisateur;

  factory _Utilisateur.fromJson(Map<String, dynamic> json) =
      _$_Utilisateur.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$UtilisateurCopyWith<_Utilisateur> get copyWith =>
      throw _privateConstructorUsedError;
}
