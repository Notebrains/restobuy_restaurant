import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';

class CartCounterNotifier extends ChangeNotifier {
  int _value = 0;

  int get value => _value;

  CartCounterNotifier() {

    MySharedPreferences().getCartItemCount().then((counter) {
      _value = counter ?? 0;
      notifyListeners();
    });
  }

  // You can send send parameters to update method. No need in my case.
  // Example:  void update(int newvalue) async { ...

  void update() async {
    int? counter = await MySharedPreferences().getCartItemCount();

    _value = counter ?? 0;
    notifyListeners();
  }
}