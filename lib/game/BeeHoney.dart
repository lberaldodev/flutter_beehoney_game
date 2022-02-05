import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beehoney_game/globals/globals.dart';
import 'package:flutter_beehoney_game/shared/BackgroundObject.dart';
import 'package:flutter_beehoney_game/shared/BeeObject.dart';
import 'package:flutter_beehoney_game/shared/FlowerObject.dart';
import 'package:flutter_beehoney_game/shared/SpiderObject.dart';

class BeeHoney extends FlameGame with KeyboardEvents, HasCollidables {
  Bg bg = Bg();
  Bg bg2 = Bg();
  Bee bee = Bee();
  Spider spider = Spider();
  Flower flower = Flower();
  TextComponent score = TextComponent(
      text: 'Score: ',
      position: Vector2(10, 10),
      textRenderer: TextPaint(style: TextStyle(color: BasicPalette.black.color)
      )
  );

  @override
  Future<void>? onLoad() async {
    bg
      ..sprite = await Sprite.load('bg.png')
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, 0);

    //bg to make infinity bg
    bg2
      ..sprite = await Sprite.load('bg.png')
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, -900);

    add(bg2);
    add(bg);

    bee
      ..sprite = await Sprite.load('bee1.png')
      ..size = Vector2.all(50)
      ..position = Vector2(250, 700)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());

    add(bee);

    spider
      ..sprite = await Sprite.load('spider1.png')
      ..size = Vector2.all(80)
      ..position = Vector2(250, 500)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());
    add(spider);

    flower
      ..sprite = await Sprite.load('florwer1.png')
      ..size = Vector2.all(20)
      ..position = Vector2(250, 300)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());
    add(flower);

    add(score);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    bg.move(dt, 100, 900, 0);
    bg2.move(dt, 100, 0, -900);

    bee.move(dt, 100);
    bee.animate(8, 4, 'bee');

    spider.animate(4, 4, 'spider');
    spider.move(dt, 100, bee);

    flower.animate(8, 2, 'florwer');
    flower.move(dt, 200);

    score.text = textScore + scoreValue.toString();

    super.update(dt);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event.data.keyLabel == 'a' && bee.position.x >= 0) {
      bee.left = true;
    } else {
      bee.left = false;
    }
    if (event.data.keyLabel == 'd' && bee.position.x <= 500) {
      bee.right = true;
    } else {
      bee.right = false;
    }
    return super.onKeyEvent(event, keysPressed);
  }
}