import 'package:flame/game.dart';
import 'package:flame_effects/game/effects_game.dart';
import 'package:flutter/material.dart';

class GameHomeWidget extends StatelessWidget {
  const GameHomeWidget({super.key, required this.game});

  final EffectsGame game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 800,
            minWidth: 550,
          ),
          child: GameWidget(game: game),
        ),
      ),
    );
  }
}
