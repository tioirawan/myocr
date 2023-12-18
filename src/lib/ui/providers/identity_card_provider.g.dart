// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$identityCardHash() => r'acc71538c7492b549b1e223cecda7310714972aa';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [identityCard].
@ProviderFor(identityCard)
const identityCardProvider = IdentityCardFamily();

/// See also [identityCard].
class IdentityCardFamily extends Family<IdentityCardModel?> {
  /// See also [identityCard].
  const IdentityCardFamily();

  /// See also [identityCard].
  IdentityCardProvider call(
    String? id,
  ) {
    return IdentityCardProvider(
      id,
    );
  }

  @override
  IdentityCardProvider getProviderOverride(
    covariant IdentityCardProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'identityCardProvider';
}

/// See also [identityCard].
class IdentityCardProvider extends AutoDisposeProvider<IdentityCardModel?> {
  /// See also [identityCard].
  IdentityCardProvider(
    String? id,
  ) : this._internal(
          (ref) => identityCard(
            ref as IdentityCardRef,
            id,
          ),
          from: identityCardProvider,
          name: r'identityCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$identityCardHash,
          dependencies: IdentityCardFamily._dependencies,
          allTransitiveDependencies:
              IdentityCardFamily._allTransitiveDependencies,
          id: id,
        );

  IdentityCardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  Override overrideWith(
    IdentityCardModel? Function(IdentityCardRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IdentityCardProvider._internal(
        (ref) => create(ref as IdentityCardRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<IdentityCardModel?> createElement() {
    return _IdentityCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IdentityCardProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IdentityCardRef on AutoDisposeProviderRef<IdentityCardModel?> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _IdentityCardProviderElement
    extends AutoDisposeProviderElement<IdentityCardModel?>
    with IdentityCardRef {
  _IdentityCardProviderElement(super.provider);

  @override
  String? get id => (origin as IdentityCardProvider).id;
}

String _$identityCardNotifierHash() =>
    r'7cf3d2e2c489d8c95703e8fe1b6e7c8e6d4dba80';

/// See also [IdentityCardNotifier].
@ProviderFor(IdentityCardNotifier)
final identityCardNotifierProvider = AsyncNotifierProvider<IdentityCardNotifier,
    List<IdentityCardModel>>.internal(
  IdentityCardNotifier.new,
  name: r'identityCardNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$identityCardNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IdentityCardNotifier = AsyncNotifier<List<IdentityCardModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
