import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numProvider = ChangeNotifierProvider((ref) => NumberProvider());

class Number {
  int number;
  int price;
  String? filter = '';
  int id;

  Number(
      {required this.number,
      required this.price,
      this.filter,
      required this.id});
}

class NumberProvider extends ChangeNotifier {
  final List<Number> _number = [
    Number(number: 1230000538, price: 7839, id: 1),
    Number(number: 8911001100, price: 540, id: 2),
    Number(number: 8100000729, price: 512, id: 3),
    Number(number: 9385777777, price: 11964, id: 4),
    Number(number: 9607799999, price: 6722, id: 5),
    Number(number: 7773077307, price: 789, id: 6),
    Number(number: 8905080508, price: 603, id: 7),
    Number(number: 7377375475, price: 650, id: 8),
    Number(number: 8400020014, price: 784, id: 9),
    Number(number: 7382616000, price: 378, id: 10),
    Number(number: 9530799999, price: 16999, id: 11),
    Number(number: 9151515323, price: 675, id: 12),
    Number(number: 9903388111, price: 486, id: 13),
    Number(number: 9408000083, price: 897, id: 14),
    Number(number: 9492639000, price: 965, id: 15),
    Number(number: 9379080001, price: 5732, id: 16),
    Number(number: 8233344459, price: 735, id: 17),
    Number(number: 7880048300, price: 587, id: 18),
    Number(number: 7400009826, price: 4243, id: 19),
    Number(number: 8686299998, price: 2643, id: 20),
    Number(number: 8233336331, price: 735, id: 21),
    Number(number: 7270000216, price: 764, id: 22),
    Number(number: 9700938000, price: 645, id: 23),
    Number(number: 8384858945, price: 673, id: 24),
    Number(number: 9903095999, price: 783, id: 25),
    Number(number: 8877997389, price: 734, id: 26),
    Number(number: 9492676000, price: 554, id: 27),
    Number(number: 7400066005, price: 8344, id: 28),
    Number(number: 9090669797, price: 884, id: 29),
    Number(number: 7270000593, price: 7999, id: 30),
    Number(number: 9992131322, price: 1400, id: 31),
    Number(number: 6361563616, price: 999, id: 32),
  ];
  List<Number> get number => _number;
}
