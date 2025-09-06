import 'package:flutter/material.dart';
import 'package:spinning_wheel/spinning_wheel.dart';

class Constants{
  static List<WheelSegment> segments = [
    WheelSegment("Gold Coin", Colors.yellow[200]!, 10),
    WheelSegment("Silver Medal", Colors.blue[200]!, 20),
    WheelSegment("Emerald Gem", Colors.green[200]!, 30),
    WheelSegment("Chocolate Box", Colors.brown[400]!, 40),
    WheelSegment("Mystery Gift", Colors.purple[200]!, 50),
    WheelSegment("Treasure Chest", Colors.orange[300]!, 60),
    WheelSegment("Lucky Star", Colors.pink[200]!, 70),
    WheelSegment("Coupon Voucher", Colors.cyan[300]!, 80),
  ];
}