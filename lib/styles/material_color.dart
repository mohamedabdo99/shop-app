import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xffe55f48, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xFF2979FF ),//10%
      100: const Color(0xFF2979FF),//20%
      200: const Color(0xFF2979FF),//30%
      300: const Color(0xFF2979FF),//40%
      400: const Color(0xFF2979FF),//50%
      500: const Color(0xFF2979FF),//60%
      600: const Color(0xFF2979FF),//70%
      700: const Color(0xFF2979FF),//80%
      800: const Color(0xFF2979FF),//90%
      900: const Color(0xFF2979FF),//100%
    },
  );
}