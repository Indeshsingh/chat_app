import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'themes_state.dart';

class ThemesCubit extends Cubit<ThemesState> {
  ThemesCubit() : super(LightThemesState());
  void toggletheme() {
    if (state is LightThemesState) {
      emit(DarkThemesState());
    } else {
      emit(LightThemesState());
    }
  }
}
