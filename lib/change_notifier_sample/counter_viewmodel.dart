import 'package:flutter/material.dart';

// ChangeNotifier => 状態管理を行えるリスナー付きのクラス 
// notifyListenersメソッドで変化があったことを通知する
class CounterViewModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count; // カウンターの値を取得

  void increment() {
    _count++; // カウンターを増やす
    notifyListeners(); // UIを更新
  }

  void decrement() {
    _count--; // カウンターを減らす
    notifyListeners(); // UIを更新
  }
}
