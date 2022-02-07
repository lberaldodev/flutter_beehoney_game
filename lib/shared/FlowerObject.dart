
import 'package:flutter_beehoney_game/shared/BaseObject.dart';

class Flower extends BaseObject {
  move(dt, speed) {
    if (y > 900) {
      y = -50.toDouble();
      x = random(50, 500).toDouble();
    } else {
      y += speed * dt.toDouble();
    }
  }
}
