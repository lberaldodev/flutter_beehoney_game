
import 'package:flame/components.dart';
import 'package:flutter_beehoney_game/globals/globals.dart';
import 'package:flutter_beehoney_game/shared/BaseObject.dart';
import 'FlowerObject.dart';
import 'SpiderObject.dart';

class Bee extends BaseObject {
  bool right = false;
  bool left = false;

  move(dt, speed) {
    if (right && x <= 475) {
      x += speed * dt;
    }
    if (left && x >= 25) {
      x -= speed * dt;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if (other is Spider) {
      if((lifesValue -1) == 0){
        isGameOver = true;
      }
      lifesValue -= 1;
      other.position.y = -100;
    }

    if (other is Flower) {
      scoreValue +=1;
      other.position.y = -100;
      other.position.x = random(50, 500);
    }
  }
}
