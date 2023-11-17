// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identity_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IdentityCardModel _$IdentityCardModelFromJson(Map<String, dynamic> json) {
  return _IdentityCardModel.fromJson(json);
}

/// @nodoc
mixin _$IdentityCardModel {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentityCardModelCopyWith<$Res> {
  factory $IdentityCardModelCopyWith(
          IdentityCardModel value, $Res Function(IdentityCardModel) then) =
      _$IdentityCardModelCopyWithImpl<$Res, IdentityCardModel>;
}

/// @nodoc
class _$IdentityCardModelCopyWithImpl<$Res, $Val extends IdentityCardModel>
    implements $IdentityCardModelCopyWith<$Res> {
  _$IdentityCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdentityCardModelImplCopyWith<$Res> {
  factory _$$IdentityCardModelImplCopyWith(_$IdentityCardModelImpl value,
          $Res Function(_$IdentityCardModelImpl) then) =
      __$$IdentityCardModelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdentityCardModelImplCopyWithImpl<$Res>
    extends _$IdentityCardModelCopyWithImpl<$Res, _$IdentityCardModelImpl>
    implements _$$IdentityCardModelImplCopyWith<$Res> {
  __$$IdentityCardModelImplCopyWithImpl(_$IdentityCardModelImpl _value,
      $Res Function(_$IdentityCardModelImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$IdentityCardModelImpl implements _IdentityCardModel {
  _$IdentityCardModelImpl();

  factory _$IdentityCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentityCardModelImplFromJson(json);

  @override
  String toString() {
    return 'IdentityCardModel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdentityCardModelImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentityCardModelImplToJson(
      this,
    );
  }
}

abstract class _IdentityCardModel implements IdentityCardModel {
  factory _IdentityCardModel() = _$IdentityCardModelImpl;

  factory _IdentityCardModel.fromJson(Map<String, dynamic> json) =
      _$IdentityCardModelImpl.fromJson;
}
