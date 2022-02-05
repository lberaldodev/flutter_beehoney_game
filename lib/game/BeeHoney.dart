import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter_beehoney_game/shared/BackgroundObject.dart';

class BeeHoney extends FlameGame {
  Bg bg = Bg();
  Bg bg2 = Bg();

  @override
  Future<void>? onLoad() async {
    bg
      ..sprite = await Sprite.load('bg.png')
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, 0);

    bg2
      ..sprite = await Sprite.load('bg.png')
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, -900);

    add(bg2);
    add(bg);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    bg.move(dt, 100, 900, 0);
    bg2.move(dt, 100, 0, -900);

    super.update(dt);
  }

}