import 'dart:math';

import 'package:flame/components.dart';

class BaseObject extends SpriteComponent with HasHitboxes, Collidable {
  int timer = 0;
  int img = 1;
  String spriteName = '';

  random(min, max){
    var r = Random();
    return min + r.nextInt(max - min);
  }

  animate(timerLimit, spritLimit, spriteName) async {
    timer += 1;

    if (timer > timerLimit) {
      timer = 0;
      img += 1;
    }

    if (img > spritLimit) {
      img = 1;
    }

    sprite = await Sprite.load(spriteName + img.toString() + ".png");
  }
}