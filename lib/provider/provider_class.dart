import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  List <String>_Fav = [];
  List <IconData>_icn = [];
  get myList => _Fav;
  get imList => _icn;
  void favour(String word,IconData icon) {
    final Lt = _Fav.contains(word);
    if (Lt) {
      _Fav.remove(word);
      _icn.remove(icon);
    } else {
      _Fav.add(word);
      _icn.add(icon);
    }
    notifyListeners();
  }

  bool icn(String word) {
    final lst = _Fav.contains(word);
    return lst;
  }
}
