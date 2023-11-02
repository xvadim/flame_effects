import 'package:flame_effects/game/effects_game.dart';
import 'package:flutter/material.dart';

import 'game/widgets/game_home_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flame Effects Demo',
      home: GameHomeWidget(game: EffectsGame()),
    );
  }
}
