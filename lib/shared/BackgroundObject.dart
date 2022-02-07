import 'package:flame/components.dart';

class Bg extends SpriteComponent {
  move(dt, speed, limit, posY) {
    y += speed * dt;

    if (y >= limit) {
      y = posY.toDouble();
    }
  }
}
