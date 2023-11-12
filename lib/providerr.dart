import 'package:flutter/foundation.dart';

class OptionProvider with ChangeNotifier {
  static String _selectedOption = 'Filter';
  String get selectedOption => _selectedOption;

  void setOption(String selectedOption) {
    _selectedOption = selectedOption;
    notifyListeners();
  }
}
