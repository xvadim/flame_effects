import 'package:flame/components.dart';
import 'package:flame/events.dart';

class TappableSpriteComponent extends SpriteComponent with TapCallbacks {
  TappableSpriteComponent({
    super.sprite,
    super.position,
    super.size,
    void Function(Component component)? onTap,
  })  : _onTap = onTap,
        super(anchor: Anchor.center);

  @override
  void onTapUp([TapUpEvent? event]) => _onTap?.call(this);

  final void Function(Component component)? _onTap;
}
