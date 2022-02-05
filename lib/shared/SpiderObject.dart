
import 'package:flutter_beehoney_game/shared/BaseObject.dart';

class Spider extends BaseObject {
  move(dt, speed, bee) {
    y += speed * dt;
    if (y > 900) {
      y = -50;
    }
    if (x < bee.x) {
      x += 2;
    } else if (x > bee.x) {
      x -= 2;
    }
  }
}