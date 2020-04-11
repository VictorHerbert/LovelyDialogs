import 'package:bloc_pattern/bloc_pattern.dart';

class ThemeBloc extends BlocBase {
  bool _isDark = false;

  set isDark(bool isDark) {
    _isDark = isDark;
    notifyListeners();
  }

  get isDark => _isDark;

  void switchColor() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
