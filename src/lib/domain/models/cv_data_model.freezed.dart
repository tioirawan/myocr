// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cv_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CvDataModel _$CvDataModelFromJson(Map<String, dynamic> json) {
  return _CvDataModel.fromJson(json);
}

/// @nodoc
mixin _$CvDataModel {
  @JsonKey(name: 'identity_card_id')
  String? get identityCardId => throw _privateConstructorUsedError;
  int? get workExperience => throw _privateConstructorUsedError;
  int? get skills => throw _privateConstructorUsedError;
  int? get location => throw _privateConstructorUsedError;
  int? get organization => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  int? get gpa => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CvDataModelCopyWith<CvDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CvDataModelCopyWith<$Res> {
  factory $CvDataModelCopyWith(
          CvDataModel value, $Res Function(CvDataModel) then) =
      _$CvDataModelCopyWithImpl<$Res, CvDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'identity_card_id') String? identityCardId,
      int? workExperience,
      int? skills,
      int? location,
      int? organization,
      int? age,
      int? gpa});
}

/// @nodoc
class _$CvDataModelCopyWithImpl<$Res, $Val extends CvDataModel>
    implements $CvDataModelCopyWith<$Res> {
  _$CvDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identityCardId = freezed,
    Object? workExperience = freezed,
    Object? skills = freezed,
    Object? location = freezed,
    Object? organization = freezed,
    Object? age = freezed,
    Object? gpa = freezed,
  }) {
    return _then(_value.copyWith(
      identityCardId: freezed == identityCardId
          ? _value.identityCardId
          : identityCardId // ignore: cast_nullable_to_non_nullable
              as String?,
      workExperience: freezed == workExperience
          ? _value.workExperience
          : workExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as int?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gpa: freezed == gpa
          ? _value.gpa
          : gpa // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CvDataModelImplCopyWith<$Res>
    implements $CvDataModelCopyWith<$Res> {
  factory _$$CvDataModelImplCopyWith(
          _$CvDataModelImpl value, $Res Function(_$CvDataModelImpl) then) =
      __$$CvDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'identity_card_id') String? identityCardId,
      int? workExperience,
      int? skills,
      int? location,
      int? organization,
      int? age,
      int? gpa});
}

/// @nodoc
class __$$CvDataModelImplCopyWithImpl<$Res>
    extends _$CvDataModelCopyWithImpl<$Res, _$CvDataModelImpl>
    implements _$$CvDataModelImplCopyWith<$Res> {
  __$$CvDataModelImplCopyWithImpl(
      _$CvDataModelImpl _value, $Res Function(_$CvDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identityCardId = freezed,
    Object? workExperience = freezed,
    Object? skills = freezed,
    Object? location = freezed,
    Object? organization = freezed,
    Object? age = freezed,
    Object? gpa = freezed,
  }) {
    return _then(_$CvDataModelImpl(
      identityCardId: freezed == identityCardId
          ? _value.identityCardId
          : identityCardId // ignore: cast_nullable_to_non_nullable
              as String?,
      workExperience: freezed == workExperience
          ? _value.workExperience
          : workExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as int?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gpa: freezed == gpa
          ? _value.gpa
          : gpa // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CvDataModelImpl extends _CvDataModel {
  _$CvDataModelImpl(
      {@JsonKey(name: 'identity_card_id') this.identityCardId,
      this.workExperience,
      this.skills,
      this.location,
      this.organization,
      this.age,
      this.gpa})
      : super._();

  factory _$CvDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CvDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'identity_card_id')
  final String? identityCardId;
  @override
  final int? workExperience;
  @override
  final int? skills;
  @override
  final int? location;
  @override
  final int? organization;
  @override
  final int? age;
  @override
  final int? gpa;

  @override
  String toString() {
    return 'CvDataModel(identityCardId: $identityCardId, workExperience: $workExperience, skills: $skills, location: $location, organization: $organization, age: $age, gpa: $gpa)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CvDataModelImpl &&
            (identical(other.identityCardId, identityCardId) ||
                other.identityCardId == identityCardId) &&
            (identical(other.workExperience, workExperience) ||
                other.workExperience == workExperience) &&
            (identical(other.skills, skills) || other.skills == skills) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gpa, gpa) || other.gpa == gpa));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, identityCardId, workExperience,
      skills, location, organization, age, gpa);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CvDataModelImplCopyWith<_$CvDataModelImpl> get copyWith =>
      __$$CvDataModelImplCopyWithImpl<_$CvDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CvDataModelImplToJson(
      this,
    );
  }
}

abstract class _CvDataModel extends CvDataModel {
  factory _CvDataModel(
      {@JsonKey(name: 'identity_card_id') final String? identityCardId,
      final int? workExperience,
      final int? skills,
      final int? location,
      final int? organization,
      final int? age,
      final int? gpa}) = _$CvDataModelImpl;
  _CvDataModel._() : super._();

  factory _CvDataModel.fromJson(Map<String, dynamic> json) =
      _$CvDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'identity_card_id')
  String? get identityCardId;
  @override
  int? get workExperience;
  @override
  int? get skills;
  @override
  int? get location;
  @override
  int? get organization;
  @override
  int? get age;
  @override
  int? get gpa;
  @override
  @JsonKey(ignore: true)
  _$$CvDataModelImplCopyWith<_$CvDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
