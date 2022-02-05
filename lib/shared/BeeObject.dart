
import 'package:flutter_beehoney_game/shared/BaseObject.dart';

class Bee extends BaseObject {
  bool right = false;
  bool left = false;

  move(dt, speed) {
    if (right) {
      x += speed * dt;
    }
    if (left) {
      x -= speed * dt;
    }
  }
}
