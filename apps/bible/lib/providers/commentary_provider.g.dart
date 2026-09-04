// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(commentary)
final commentaryProvider = CommentaryFamily._();

final class CommentaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<CommentaryBook>,
          CommentaryBook,
          FutureOr<CommentaryBook>
        >
    with $FutureModifier<CommentaryBook>, $FutureProvider<CommentaryBook> {
  CommentaryProvider._({
    required CommentaryFamily super.from,
    required ({CommentaryType type, BookType book}) super.argument,
  }) : super(
         retry: null,
         name: r'commentaryProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentaryHash();

  @override
  String toString() {
    return r'commentaryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<CommentaryBook> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CommentaryBook> create(Ref ref) {
    final argument = this.argument as ({CommentaryType type, BookType book});
    return commentary(ref, type: argument.type, book: argument.book);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentaryHash() => r'258b06717fcf2eed530d69ffeba1e5c97b509cba';

final class CommentaryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<CommentaryBook>,
          ({CommentaryType type, BookType book})
        > {
  CommentaryFamily._()
    : super(
        retry: null,
        name: r'commentaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CommentaryProvider call({
    required CommentaryType type,
    required BookType book,
  }) => CommentaryProvider._(argument: (type: type, book: book), from: this);

  @override
  String toString() => r'commentaryProvider';
}
