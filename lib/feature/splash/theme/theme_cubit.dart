import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'SavedTheme';

  ThemeCubit() : super(ThemeInitial()) {
    loadTheme();
  }

  Future<void> toggleTheme() async {
    if (state is ThemeLight) {
      await _darkTheme();
    } else {
      await _lightTheme();
    }
  }

  Future<void> loadTheme() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? savedTheme = preferences.getString(_themeKey);
    if (savedTheme == 'light') {
      emit(ThemeLight());
    } else if (savedTheme == 'dark') {
      emit(ThemeDark());
    }
  }

  Future<void> _lightTheme() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_themeKey, 'light');
    emit(ThemeLight());
  }

  Future<void> _darkTheme() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_themeKey, 'dark');
    emit(ThemeDark());
  }
}
