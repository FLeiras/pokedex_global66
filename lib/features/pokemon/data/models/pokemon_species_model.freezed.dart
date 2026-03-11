// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_species_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonSpeciesModel {
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get genderRate => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSpeciesModelCopyWith<PokemonSpeciesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSpeciesModelCopyWith<$Res> {
  factory $PokemonSpeciesModelCopyWith(
          PokemonSpeciesModel value, $Res Function(PokemonSpeciesModel) then) =
      _$PokemonSpeciesModelCopyWithImpl<$Res, PokemonSpeciesModel>;
  @useResult
  $Res call({String description, String category, int genderRate});
}

/// @nodoc
class _$PokemonSpeciesModelCopyWithImpl<$Res, $Val extends PokemonSpeciesModel>
    implements $PokemonSpeciesModelCopyWith<$Res> {
  _$PokemonSpeciesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? category = null,
    Object? genderRate = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      genderRate: null == genderRate
          ? _value.genderRate
          : genderRate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonSpeciesModelImplCopyWith<$Res>
    implements $PokemonSpeciesModelCopyWith<$Res> {
  factory _$$PokemonSpeciesModelImplCopyWith(_$PokemonSpeciesModelImpl value,
          $Res Function(_$PokemonSpeciesModelImpl) then) =
      __$$PokemonSpeciesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String category, int genderRate});
}

/// @nodoc
class __$$PokemonSpeciesModelImplCopyWithImpl<$Res>
    extends _$PokemonSpeciesModelCopyWithImpl<$Res, _$PokemonSpeciesModelImpl>
    implements _$$PokemonSpeciesModelImplCopyWith<$Res> {
  __$$PokemonSpeciesModelImplCopyWithImpl(_$PokemonSpeciesModelImpl _value,
      $Res Function(_$PokemonSpeciesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? category = null,
    Object? genderRate = null,
  }) {
    return _then(_$PokemonSpeciesModelImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      genderRate: null == genderRate
          ? _value.genderRate
          : genderRate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PokemonSpeciesModelImpl implements _PokemonSpeciesModel {
  const _$PokemonSpeciesModelImpl(
      {required this.description,
      required this.category,
      required this.genderRate});

  @override
  final String description;
  @override
  final String category;
  @override
  final int genderRate;

  @override
  String toString() {
    return 'PokemonSpeciesModel(description: $description, category: $category, genderRate: $genderRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSpeciesModelImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.genderRate, genderRate) ||
                other.genderRate == genderRate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, description, category, genderRate);

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSpeciesModelImplCopyWith<_$PokemonSpeciesModelImpl> get copyWith =>
      __$$PokemonSpeciesModelImplCopyWithImpl<_$PokemonSpeciesModelImpl>(
          this, _$identity);
}

abstract class _PokemonSpeciesModel implements PokemonSpeciesModel {
  const factory _PokemonSpeciesModel(
      {required final String description,
      required final String category,
      required final int genderRate}) = _$PokemonSpeciesModelImpl;

  @override
  String get description;
  @override
  String get category;
  @override
  int get genderRate;

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonSpeciesModelImplCopyWith<_$PokemonSpeciesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
