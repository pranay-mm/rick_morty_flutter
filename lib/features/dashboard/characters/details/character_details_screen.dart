import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/details/character_details_provider.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/favourite/character_favourite_provider.dart';
import 'package:rick_morty_flutter/generated/l10n.dart';
import 'package:rick_morty_flutter/models/ui_state.dart';
import 'package:rick_morty_flutter/ui/model/ui_character.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterInfoPage extends ConsumerStatefulWidget {
  static const String id = 'character_details_screen';

  const CharacterInfoPage({Key? key, required this.charId}) : super(key: key);
  final int charId;

  @override
  ConsumerState<CharacterInfoPage> createState() => _CharacterInfoWidgetState();
}

class _CharacterInfoWidgetState extends ConsumerState<CharacterInfoPage> {
  bool isFavorited = false;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(charecterDetailsProvider);
    final isPageLoading =
        ref.read(charecterDetailsProvider.notifier).isPageLoadInProgress;

    if (state is Loading || state is Initial) {
      return const Align(
        child: CircularProgressIndicator(),
      );
    } else if (state is Failure) {
      return Align(
        child: Text((state as Failure).exception),
      );
    } else {
      UiCharacter characterData = (state as Success).data as UiCharacter;
      return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Hero(
                            tag: Key('image${characterData.id}'),
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: characterData.image!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BackButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                        ),
                      ),
                      Positioned(
                          bottom: 12,
                          right: 24,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              color: const Color(0xFFE8DEF8),
                              child: IconButton(
                                key: const Key('like'),
                                onPressed: isPageLoading
                                    ? null
                                    : () {
                                        setState(() {
                                          ref
                                              .read(charecterDetailsProvider
                                                  .notifier)
                                              .isPageLoadInProgress = true;
                                          ref
                                              .read(charecterDetailsProvider
                                                  .notifier)
                                              .updateCharacter();
                                          //ignore: unused_result
                                          ref.refresh(
                                              charecterFavoriteListProvider);
                                        });
                                      },
                                icon: Icon(
                                  characterData.isFavorited
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: characterData.isFavorited
                                      ? const Color(0xff6750A4)
                                      : const Color(0xFF000000),
                                  size: 24,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                  getCharacterBioWidget(
                    characterData.name!,
                    characterData.gender ?? '',
                    characterData.origin?.name! ?? '',
                    characterData.location?.name ?? '',
                    characterData.status ?? '',
                    characterData.species ?? '',
                    characterData.episodesList(),
                  )
                ],
              ),
            )),
      );
    }
  }

  Widget getCharacterBioWidget(String name, String gender, String origin,
      String location, String status, String species, String episodes) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: context.textTheme.headlineLarge
                  ?.copyWith(color: context.colorScheme.primary),
            ),
            const SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: context.width / 4.6,
                  child: Text(
                    '${S.of(context).status}:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0.27,
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(status,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        letterSpacing: 0.27,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width / 4.6,
                  child: Text('${S.of(context).species}:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.27,
                        color: context.colorScheme.onPrimaryContainer,
                      )),
                ),
                Expanded(
                    child: Text(
                  species,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    letterSpacing: 0.27,
                  ),
                )),
                const SizedBox(height: 16),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width / 4.6,
                  child: Text('${S.of(context).gender}:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.27,
                        color: context.colorScheme.onPrimaryContainer,
                      )),
                ),
                Expanded(
                    child: Text(
                  gender,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    letterSpacing: 0.27,
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: context.width / 4.6,
                    child: Text(
                      '${S.of(context).origin}:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.27,
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    )),
                Expanded(
                    child: Text(
                  origin,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    letterSpacing: 0.27,
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width / 4.6,
                  child: Text(
                    '${S.of(context).location}:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0.27,
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(location,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        letterSpacing: 0.27,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: context.width / 4.6,
                    child: Text(
                      '${S.of(context).episodes}:',
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.27,
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    )),
                Expanded(
                  child: Text(
                    episodes,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      letterSpacing: 0.27,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
