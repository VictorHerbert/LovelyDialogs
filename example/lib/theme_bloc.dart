import 'package:bloc_pattern/bloc_pattern.dart';

class ThemeBloc extends BlocBase{

	bool _isDialogActive = false;
	bool _isDark = false;

	set isDialogActive(bool isDialogActive){
		_isDialogActive = isDialogActive;
		notifyListeners();
	}

	get isDialogActive => _isDialogActive;

	set isDark(bool isDark){
		_isDark = isDark;
		notifyListeners();
	}

	get isDark => _isDark;

	void switchColor(){
		_isDark = !_isDark;
		notifyListeners();
	}

}