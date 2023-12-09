// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_scanner_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardScannerResultModel _$CardScannerResultModelFromJson(
    Map<String, dynamic> json) {
  return _CardScannerResultModel.fromJson(json);
}

/// @nodoc
mixin _$CardScannerResultModel {
  @JsonKey(
      fromJson: CardScannerResultModel._bytesFromJson,
      toJson: CardScannerResultModel._bytesToJson)
  Uint8List? get croppedImage => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: CardScannerResultModel._bytesFromJson,
      toJson: CardScannerResultModel._bytesToJson)
  Uint8List? get photoImage => throw _privateConstructorUsedError;
  IdentityCardModel? get identityCard => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardScannerResultModelCopyWith<CardScannerResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardScannerResultModelCopyWith<$Res> {
  factory $CardScannerResultModelCopyWith(CardScannerResultModel value,
          $Res Function(CardScannerResultModel) then) =
      _$CardScannerResultModelCopyWithImpl<$Res, CardScannerResultModel>;
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: CardScannerResultModel._bytesFromJson,
          toJson: CardScannerResultModel._bytesToJson)
      Uint8List? croppedImage,
      @JsonKey(
          fromJson: CardScannerResultModel._bytesFromJson,
          toJson: CardScannerResultModel._bytesToJson)
      Uint8List? photoImage,
      IdentityCardModel? identityCard});

  $IdentityCardModelCopyWith<$Res>? get identityCard;
}

/// @nodoc
class _$CardScannerResultModelCopyWithImpl<$Res,
        $Val extends CardScannerResultModel>
    implements $CardScannerResultModelCopyWith<$Res> {
  _$CardScannerResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? croppedImage = freezed,
    Object? photoImage = freezed,
    Object? identityCard = freezed,
  }) {
    return _then(_value.copyWith(
      croppedImage: freezed == croppedImage
          ? _value.croppedImage
          : croppedImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      photoImage: freezed == photoImage
          ? _value.photoImage
          : photoImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      identityCard: freezed == identityCard
          ? _value.identityCard
          : identityCard // ignore: cast_nullable_to_non_nullable
              as IdentityCardModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdentityCardModelCopyWith<$Res>? get identityCard {
    if (_value.identityCard == null) {
      return null;
    }

    return $IdentityCardModelCopyWith<$Res>(_value.identityCard!, (value) {
      return _then(_value.copyWith(identityCard: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardScannerResultModelImplCopyWith<$Res>
    implements $CardScannerResultModelCopyWith<$Res> {
  factory _$$CardScannerResultModelImplCopyWith(
          _$CardScannerResultModelImpl value,
          $Res Function(_$CardScannerResultModelImpl) then) =
      __$$CardScannerResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: CardScannerResultModel._bytesFromJson,
          toJson: CardScannerResultModel._bytesToJson)
      Uint8List? croppedImage,
      @JsonKey(
          fromJson: CardScannerResultModel._bytesFromJson,
          toJson: CardScannerResultModel._bytesToJson)
      Uint8List? photoImage,
      IdentityCardModel? identityCard});

  @override
  $IdentityCardModelCopyWith<$Res>? get identityCard;
}

/// @nodoc
class __$$CardScannerResultModelImplCopyWithImpl<$Res>
    extends _$CardScannerResultModelCopyWithImpl<$Res,
        _$CardScannerResultModelImpl>
    implements _$$CardScannerResultModelImplCopyWith<$Res> {
  __$$CardScannerResultModelImplCopyWithImpl(
      _$CardScannerResultModelImpl _value,
      $Res Function(_$CardScannerResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? croppedImage = freezed,
    Object? photoImage = freezed,
    Object? identityCard = freezed,
  }) {
    return _then(_$CardScannerResultModelImpl(
      croppedImage: freezed == croppedImage
          ? _value.croppedImage
          : croppedImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      photoImage: freezed == photoImage
          ? _value.photoImage
          : photoImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      identityCard: freezed == identityCard
          ? _value.identityCard
          : identityCard // ignore: cast_nullable_to_non_nullable
              as IdentityCardModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardScannerResultModelImpl
    with DiagnosticableTreeMixin
    implements _CardScannerResultModel {
  _$CardScannerResultModelImpl(
      {@JsonKey(
          fromJson: CardScannerResultModel._bytesFromJson,
          toJson: CardScannerResultModel._bytesToJson)
      this.croppedImage,
      @JsonKey(
          fromJson: CardScannerResultModel._bytesFromJson,
          toJson: CardScannerResultModel._bytesToJson)
      this.photoImage,
      this.identityCard});

  factory _$CardScannerResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardScannerResultModelImplFromJson(json);

  @override
  @JsonKey(
      fromJson: CardScannerResultModel._bytesFromJson,
      toJson: CardScannerResultModel._bytesToJson)
  final Uint8List? croppedImage;
  @override
  @JsonKey(
      fromJson: CardScannerResultModel._bytesFromJson,
      toJson: CardScannerResultModel._bytesToJson)
  final Uint8List? photoImage;
  @override
  final IdentityCardModel? identityCard;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardScannerResultModel(croppedImage: $croppedImage, photoImage: $photoImage, identityCard: $identityCard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardScannerResultModel'))
      ..add(DiagnosticsProperty('croppedImage', croppedImage))
      ..add(DiagnosticsProperty('photoImage', photoImage))
      ..add(DiagnosticsProperty('identityCard', identityCard));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardScannerResultModelImpl &&
            const DeepCollectionEquality()
                .equals(other.croppedImage, croppedImage) &&
            const DeepCollectionEquality()
                .equals(other.photoImage, photoImage) &&
            (identical(other.identityCard, identityCard) ||
                other.identityCard == identityCard));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(croppedImage),
      const DeepCollectionEquality().hash(photoImage),
      identityCard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardScannerResultModelImplCopyWith<_$CardScannerResultModelImpl>
      get copyWith => __$$CardScannerResultModelImplCopyWithImpl<
          _$CardScannerResultModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardScannerResultModelImplToJson(
      this,
    );
  }
}

abstract class _CardScannerResultModel implements CardScannerResultModel {
  factory _CardScannerResultModel(
      {@JsonKey(
          fromJson: CardScannerResultModel._bytesFromJson,
          toJson: CardScannerResultModel._bytesToJson)
      final Uint8List? croppedImage,
      @JsonKey(
          fromJson: CardScannerResultModel._bytesFromJson,
          toJson: CardScannerResultModel._bytesToJson)
      final Uint8List? photoImage,
      final IdentityCardModel? identityCard}) = _$CardScannerResultModelImpl;

  factory _CardScannerResultModel.fromJson(Map<String, dynamic> json) =
      _$CardScannerResultModelImpl.fromJson;

  @override
  @JsonKey(
      fromJson: CardScannerResultModel._bytesFromJson,
      toJson: CardScannerResultModel._bytesToJson)
  Uint8List? get croppedImage;
  @override
  @JsonKey(
      fromJson: CardScannerResultModel._bytesFromJson,
      toJson: CardScannerResultModel._bytesToJson)
  Uint8List? get photoImage;
  @override
  IdentityCardModel? get identityCard;
  @override
  @JsonKey(ignore: true)
  _$$CardScannerResultModelImplCopyWith<_$CardScannerResultModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
