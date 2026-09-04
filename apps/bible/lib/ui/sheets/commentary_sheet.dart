import 'package:bible/models/commentary_type.dart';
import 'package:bible/providers/commentary_provider.dart';
import 'package:bible/ui/widgets/commentary_content.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lux/i18n.dart';
import 'package:lux/lux.dart';
import 'package:style/style.dart';

class CommentarySheet {
  static List<Widget> buildSheetChildren(
    BuildContext context,
    WidgetRef ref, {
    required VerseSelection verseSelection,
    required CommentaryType commentaryType,
    required Function(VerseSelection) onNavigateToVerseSelection,
  }) {
    final book = verseSelection.references.first.book;
    final commentary = ref.watch(commentaryProvider(type: commentaryType, book: book)).value;
    if (commentary == null) {
      return [Padding(padding: .all(16), child: StyledLoading())];
    }

    final hasIntroduction =
        commentary.introduction.isNotEmpty &&
        verseSelection.references.any((reference) => reference.chapterNum == 1 && reference.verseNum == 1);
    final children = [
      if (hasIntroduction)
        CommentaryIntroductionView(
          book: book,
          content: commentary.introduction,
          onNavigateToVerseSelection: onNavigateToVerseSelection,
        ),
      ...commentary
          .getBlocksFor(verseSelection)
          .map((block) => CommentaryBlockView(block: block, onNavigateToVerseSelection: onNavigateToVerseSelection)),
    ];
    return children.isEmpty
        ? [
            Padding(
              padding: .all(16),
              child: StyledBanner(message: t.emptyStates.noCommentaries.toText()),
            ),
          ]
        : StyledDivider(height: 2).wrapPositioned(children);
  }
}
