import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/list/character_item_widget.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/list/character_list_provider.dart';
import 'package:rick_morty_flutter/models/ui_state.dart';
import 'package:rick_morty_flutter/ui/model/ui_character.dart';

class CharacterListScreen extends ConsumerStatefulWidget {
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
    log('State response:$state');
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
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  } else {
                    final count = listItem.length;

                    return NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification.metrics.pixels ==
                            scrollNotification.metrics.maxScrollExtent) {
                          // TODO: load more
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
                              // Navigate to character information
                            },
                            character: listItem[index],
                          );
                        },
                      ),
                    );
                  }
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
}
