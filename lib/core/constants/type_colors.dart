import 'package:flutter/material.dart';

class PokemonTypeColors {
  static const Map<String, Color> typeColors = {
    'water': Color(0xFF399CFF),
    'fire': Color(0xFFFF4422),
    'electric': Color(0xFFFFCC33),
    'ground': Color(0xFFDDB164),
    'rock': Color(0xFFBB5544),
    'steel': Color(0xFFAAAAAA),
    'psychic': Color(0xFFFF5599),
    'normal': Color(0xFFAAA99F),
    'dark': Color(0xFF775544),
    'fighting': Color(0xFFBB5544),
    'flying': Color(0xFF8899FF),
    'ghost': Color(0xFF6666BB),
    'ice': Color(0xFF66CCFF),
    'grass': Color(0xFF77CC55),
    'fairy': Color(0xFFEE99EE),
    'poison': Color(0xFFAA5599),
    'bug': Color(0xFFAABB23),
    'dragon': Color(0xFF7766EE),
  };

  static Color getColorForType(String type) {
    return typeColors[type.toLowerCase()] ?? Colors.grey;
  }
}