import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/generated/l10n.dart';
import 'package:rick_morty_flutter/ui/model/ui_character.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterInfoPage extends ConsumerStatefulWidget {
  const CharacterInfoPage({Key? key, required this.characterData})
      : super(key: key);
  final UiCharacter characterData;

  @override
  ConsumerState<CharacterInfoPage> createState() => _CharacterInfoWidgetState();
}

class _CharacterInfoWidgetState extends ConsumerState<CharacterInfoPage> {
  bool isLiked=false;
  @override
  Widget build(BuildContext context) {
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
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Hero(
                          tag: widget.characterData.id!,
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: widget.characterData.image!,
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 24,
                      child: LikeButton(
                        isLiked: isLiked,
                        size: 40,
                        circleColor: const CircleColor(
                          start: Color(0xffe8def8),
                          end: Color(0xffe8def8),
                        ),
                        bubblesColor: const BubblesColor(
                          dotPrimaryColor: Color(0xff6750A4),
                          dotSecondaryColor: Color(0xffe8def8),
                        ),
                        likeBuilder: (bool isLiked) {
                          return ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              color: const Color(0xFFE8DEF8),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isLiked=!isLiked;
                                  });
                                },
                                icon: Icon(
                                  isLiked ? Icons.star : Icons.star_border,
                                  color: isLiked
                                      ? const Color(0xff6750A4)
                                      : const Color(0xFF000000),
                                  size: 24,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                getCharacterBioWidget(
                  widget.characterData.name!,
                  widget.characterData.gender ?? '',
                  widget.characterData.origin?.name! ?? '',
                  widget.characterData.location?.name ?? '',
                  widget.characterData.status ?? '',
                  widget.characterData.species ?? '',
                  widget.characterData.episodesList(),
                )
              ],
            ),
          )),
    );
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
