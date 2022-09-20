import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

final soldProvider = ChangeNotifierProvider((ref) => SoldProvider());

class SoldModel {
  int? number;
  int? price;

  SoldModel({
    required this.number,
    required this.price,
  });
}

class SoldProvider extends ChangeNotifier {
  final List<SoldModel> _sold = [];

  List<SoldModel> get sold => _sold;

  void addNumber(int number, int price) {
    _sold.add(SoldModel(number: number, price: price));
    notifyListeners();
  }
}
