// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_scanner_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cardScannerRepositoryHash() =>
    r'02d57a836bfcca952852b2a104c83257cba37a4f';

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

/// See also [cardScannerRepository].
@ProviderFor(cardScannerRepository)
const cardScannerRepositoryProvider = CardScannerRepositoryFamily();

/// See also [cardScannerRepository].
class CardScannerRepositoryFamily extends Family<CardScannerRepository> {
  /// See also [cardScannerRepository].
  const CardScannerRepositoryFamily();

  /// See also [cardScannerRepository].
  CardScannerRepositoryProvider call(
    OCRMethod method,
  ) {
    return CardScannerRepositoryProvider(
      method,
    );
  }

  @override
  CardScannerRepositoryProvider getProviderOverride(
    covariant CardScannerRepositoryProvider provider,
  ) {
    return call(
      provider.method,
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
  String? get name => r'cardScannerRepositoryProvider';
}

/// See also [cardScannerRepository].
class CardScannerRepositoryProvider
    extends AutoDisposeProvider<CardScannerRepository> {
  /// See also [cardScannerRepository].
  CardScannerRepositoryProvider(
    OCRMethod method,
  ) : this._internal(
          (ref) => cardScannerRepository(
            ref as CardScannerRepositoryRef,
            method,
          ),
          from: cardScannerRepositoryProvider,
          name: r'cardScannerRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cardScannerRepositoryHash,
          dependencies: CardScannerRepositoryFamily._dependencies,
          allTransitiveDependencies:
              CardScannerRepositoryFamily._allTransitiveDependencies,
          method: method,
        );

  CardScannerRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.method,
  }) : super.internal();

  final OCRMethod method;

  @override
  Override overrideWith(
    CardScannerRepository Function(CardScannerRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CardScannerRepositoryProvider._internal(
        (ref) => create(ref as CardScannerRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        method: method,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<CardScannerRepository> createElement() {
    return _CardScannerRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CardScannerRepositoryProvider && other.method == method;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, method.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CardScannerRepositoryRef
    on AutoDisposeProviderRef<CardScannerRepository> {
  /// The parameter `method` of this provider.
  OCRMethod get method;
}

class _CardScannerRepositoryProviderElement
    extends AutoDisposeProviderElement<CardScannerRepository>
    with CardScannerRepositoryRef {
  _CardScannerRepositoryProviderElement(super.provider);

  @override
  OCRMethod get method => (origin as CardScannerRepositoryProvider).method;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
