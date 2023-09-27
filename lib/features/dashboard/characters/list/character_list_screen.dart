import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/details/character_details_screen.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/list/character_item_widget.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/list/character_list_provider.dart';
import 'package:rick_morty_flutter/gen/assets.gen.dart';
import 'package:rick_morty_flutter/generated/l10n.dart';
import 'package:rick_morty_flutter/models/ui_state.dart';
import 'package:rick_morty_flutter/ui/model/ui_character.dart';

class CharacterListScreen extends ConsumerStatefulWidget {
  static const String id = 'character_list_screen';

  const CharacterListScreen({super.key});

  @override
  ConsumerState<CharacterListScreen> createState() =>
      _CharacterListScreenState();
}

class _CharacterListScreenState extends ConsumerState<CharacterListScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(charecterListProvider);
    final readState = ref.read(charecterListProvider.notifier);
    if (state is Loading || state is Initial) {
      return const Align(
        child: CircularProgressIndicator(),
      );
    } else if (state is Failure) {
      return Align(
        child: Text((state as Failure).exception),
      );
    } else {
      final listItem = (state as Success).data as List<UiCharacter>;
      if (listItem.isEmpty) {
        return errorWidget();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: FutureBuilder<bool>(
                future: delay(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<bool> snapshot,
                ) {
                  final count = listItem.length;

                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification.metrics.pixels ==
                          scrollNotification.metrics.maxScrollExtent) {
                        if (!readState.isPageLoadInProgress) {
                          //readState.page++;
                          readState
                            ..loadCharacters(true)
                            ..isPageLoadInProgress = true;
                        }
                      }
                      return false;
                    },
                    child: ListView.separated(
                      itemCount: count,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 12,
                      ),
                      key: const Key('characterListView'),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CharacterItemWidget(
                          key: Key('characterItem:$index'),
                          callback: (characterId) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => CharacterInfoPage(
                                        characterData: listItem[index])));
                          },
                          character: listItem[index],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          )
        ],
      );
    }
  }

  Future<bool> delay() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 100));
    return true;
  }

  Widget errorWidget() {
    return Align(
      child: Column(
        children: [
          Flexible(
            child: SizedBox(
              height: 200.0,
              child: Assets.images.rickAndMortyAuthBg2.image(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            textAlign: TextAlign.center,
            S.of(context).error_message,
            style: context.textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
