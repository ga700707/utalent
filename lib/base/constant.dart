import 'package:flutter/material.dart';

class MaxSize {
  static double width = 0;
  static double height = 0;
  // 構造函數，需和類同名
  initWH(context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }
}
