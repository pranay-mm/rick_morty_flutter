import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/details/character_details_provider.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/details/character_details_screen.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/favourite/character_favourite_provider.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/list/character_item_widget.dart';
import 'package:rick_morty_flutter/gen/assets.gen.dart';
import 'package:rick_morty_flutter/generated/l10n.dart';
import 'package:rick_morty_flutter/models/ui_state.dart';
import 'package:rick_morty_flutter/ui/model/ui_character.dart';

class CharacterFavouriteListScreen extends ConsumerStatefulWidget {
  const CharacterFavouriteListScreen({super.key});

  @override
  ConsumerState<CharacterFavouriteListScreen> createState() =>
      _CharacterListScreenState();
}

class _CharacterListScreenState
    extends ConsumerState<CharacterFavouriteListScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(charecterFavoriteListProvider);
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
      final count = listItem.length;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ListView.separated(
                  itemCount: count,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 12,
                  ),
                  key: const Key('favcharacterListView'),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CharacterItemWidget(
                      key: Key('characterItem:$index'),
                      callback: (characterId) async {
                        ref.read(idProider.notifier).updateState(characterId);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) =>
                                    CharacterInfoPage(charId: characterId)));
                      },
                      character: listItem[index],
                    );
                  },
                )),
          )
        ],
      );
    }
  }

  Widget errorWidget() {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.0,
            child: Assets.images.rickAndMortyAuthBg2.image(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            textAlign: TextAlign.center,
            S.of(context).empty_favourite_screen,
            style: context.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
