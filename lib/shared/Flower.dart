
import 'package:flutter_beehoney_game/shared/BaseObject.dart';

class Flower extends BaseObject {
  move(dt, speed) {
    if (y > 900) {
      y = -50;
      x = random(50, 500);
    } else {
      y += speed * dt;
    }
  }
}
