import 'package:flutter/material.dart';
import 'package:flutter_beehoney_game/game/BeeHoney.dart';
import 'package:flutter_beehoney_game/globals/globals.dart';
import 'package:flutter_beehoney_game/screens/MainMenu.dart';

Widget gameOverWidget(BuildContext buildContext, BeeHoney game) {
  return GestureDetector(
    onTap: () {
      lifesValue = 3;
      scoreValue = 0;
      isGameOver = false;
      Navigator.push(buildContext, MaterialPageRoute(builder: (context) => const MainMenu()));
    },
    child: SizedBox(
      width: MediaQuery.of(buildContext).size.width,
      height: MediaQuery.of(buildContext).size.height,
      child: Image.asset(
        "assets/images/gameover.png",
        fit: BoxFit.fill,
      ),
    ),
  );
}