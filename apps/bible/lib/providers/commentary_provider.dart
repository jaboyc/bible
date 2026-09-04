import 'package:bible/functions/commentary_importer.dart';
import 'package:bible/models/commentary.dart';
import 'package:bible/models/commentary_type.dart';
import 'package:lux/lux_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'commentary_provider.g.dart';

@Riverpod(keepAlive: true)
Future<CommentaryBook> commentary(Ref ref, {required CommentaryType type, required BookType book}) =>
    CommentaryImporter().import(type: type, book: book);
