import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/ui/model/ui_character.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterItemWidget extends StatefulWidget {
  const CharacterItemWidget({
    super.key,
    this.character,
    required this.callback,
  });

  final void Function(String) callback;
  final UiCharacter? character;

  @override
  State<CharacterItemWidget> createState() => _CharacterItemWidgetState();
}

class _CharacterItemWidgetState extends State<CharacterItemWidget> {
  final borderRadius = const BorderRadius.all(Radius.circular(16));
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;//TODO make it app wise state
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: borderRadius),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.4),
                                  Colors.black.withOpacity(0.67)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: borderRadius),
                        child: ClipRRect(
                          borderRadius: borderRadius,
                          child: Hero(
                            tag: widget.character!.id!,
                            child: FadeInImage(
                                fit: BoxFit.cover,
                                height: 140,
                                width: double.infinity,
                                placeholder: MemoryImage(kTransparentImage),
                                image: NetworkImage(widget.character!.image!)),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isExpanded,
                        maintainAnimation: true,
                        maintainState: true,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                          opacity: isExpanded ? 1 : 0,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0,
                                right: 14.0,
                                top: 18.0,
                                bottom: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name:'),
                                    Text('Species:'),
                                  ],
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.character!.species!,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: context
                                                .colorScheme.onPrimaryContainer,
                                          )),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        widget.character!.name!,
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(
                                                color: context.colorScheme
                                                    .onPrimaryContainer),
                                      )
                                    ],
                                  ),
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  onPressed: () {
                                    widget.callback(
                                        widget.character!.id.toString());
                                  },
                                  child: const Icon(Icons.arrow_forward),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
