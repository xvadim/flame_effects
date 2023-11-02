import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/animation.dart';
import 'sprites/tapable_sprite.dart';

class EffectsGame extends FlameGame with HasGameRef<FlameGame> {
  @override
  Future<void>? onLoad() async {
    super.onLoad();

    await _loadSprites();

    add(TextComponent(text: 'Tap on Dashes'));
    add(_leftDash);
    add(_centerDash);
    add(_rightDash);
  }

  late TappableSpriteComponent _centerDash;
  late TappableSpriteComponent _leftDash;
  late TappableSpriteComponent _rightDash;

  Future<void> _loadSprites() async {
    final left = await gameRef.loadSprite('dash_left.png');
    _leftDash = TappableSpriteComponent(
      sprite: left,
      size: Vector2(79, 109),
      position: canvasSize / 4,
      onTap: (_) {
        final scale = _leftDash.scale.x <= 1.0 ? 1.5 : 1.0;
        _leftDash.add(
          ScaleEffect.to(
            Vector2.all(scale),
            // EffectController(duration: 0.5),
            EffectController(duration: 0.3, curve: Curves.easeInOutBack),
          ),
        );
      },
    );

    final center = await gameRef.loadSprite('dash_center.png');
    _centerDash = TappableSpriteComponent(
      sprite: center,
      size: Vector2(79, 109),
      position: canvasSize / 2,
      onTap: (_) {
        _centerDash.add(
          RotateEffect.by(
            tau,
            // EffectController(duration: 0.5),
            InfiniteEffectController(EffectController(duration: 1)),
          ),
        );
      },
    );

    final seqEf = SequenceEffect(
      [
        MoveEffect.to(
          Vector2(canvasSize.x * 0.75, canvasSize.y / 2),
          // EffectController(duration: 1),
          EffectController(duration: 1, curve: Curves.fastOutSlowIn),
        ),
        ScaleEffect.to(
          Vector2.all(1.5),
          EffectController(duration: 1, curve: Curves.easeInOutBack),
        ),
        OpacityEffect.to(
          0.5,
          EffectController(duration: 0.3),
        ),
        RemoveEffect(delay: .5),
      ],
    );

    final right = await gameRef.loadSprite('dash_right.png');
    _rightDash = TappableSpriteComponent(
      sprite: right,
      size: Vector2(79, 109),
      position: canvasSize * 0.75,
      onTap: (_) {
        _rightDash.add(seqEf);
      },
    );
  }
}
