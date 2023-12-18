// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dss_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DssResultModel _$DssResultModelFromJson(Map<String, dynamic> json) {
  return _DssResultModel.fromJson(json);
}

/// @nodoc
mixin _$DssResultModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DssResultModelCopyWith<DssResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DssResultModelCopyWith<$Res> {
  factory $DssResultModelCopyWith(
          DssResultModel value, $Res Function(DssResultModel) then) =
      _$DssResultModelCopyWithImpl<$Res, DssResultModel>;
  @useResult
  $Res call({String? id, String? name, double? score});
}

/// @nodoc
class _$DssResultModelCopyWithImpl<$Res, $Val extends DssResultModel>
    implements $DssResultModelCopyWith<$Res> {
  _$DssResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DssResultModelImplCopyWith<$Res>
    implements $DssResultModelCopyWith<$Res> {
  factory _$$DssResultModelImplCopyWith(_$DssResultModelImpl value,
          $Res Function(_$DssResultModelImpl) then) =
      __$$DssResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, double? score});
}

/// @nodoc
class __$$DssResultModelImplCopyWithImpl<$Res>
    extends _$DssResultModelCopyWithImpl<$Res, _$DssResultModelImpl>
    implements _$$DssResultModelImplCopyWith<$Res> {
  __$$DssResultModelImplCopyWithImpl(
      _$DssResultModelImpl _value, $Res Function(_$DssResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? score = freezed,
  }) {
    return _then(_$DssResultModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DssResultModelImpl implements _DssResultModel {
  _$DssResultModelImpl({this.id, this.name, this.score});

  factory _$DssResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DssResultModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final double? score;

  @override
  String toString() {
    return 'DssResultModel(id: $id, name: $name, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DssResultModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DssResultModelImplCopyWith<_$DssResultModelImpl> get copyWith =>
      __$$DssResultModelImplCopyWithImpl<_$DssResultModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DssResultModelImplToJson(
      this,
    );
  }
}

abstract class _DssResultModel implements DssResultModel {
  factory _DssResultModel(
      {final String? id,
      final String? name,
      final double? score}) = _$DssResultModelImpl;

  factory _DssResultModel.fromJson(Map<String, dynamic> json) =
      _$DssResultModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  double? get score;
  @override
  @JsonKey(ignore: true)
  _$$DssResultModelImplCopyWith<_$DssResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
