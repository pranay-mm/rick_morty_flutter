import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/list/character_list_provider.dart';
import 'package:rick_morty_flutter/models/ui_state.dart';

class CharacterListScreen extends ConsumerStatefulWidget {
  const CharacterListScreen({super.key});

  @override
  ConsumerState<CharacterListScreen> createState() =>
      _CharacterListScreenState();
}

class _CharacterListScreenState extends ConsumerState<CharacterListScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(charecterListProvider);
    log('State response:$state');
    if (state == Loading()) {
      return Center();
    } else if (state == Initial) {
      return Center();
    } else if (state == Failure) {
      return Center();
    } else {
      return Center();
    }
  }
}
