import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'themes_state.dart';

class ThemesCubit extends Cubit<ThemesState> {
  ThemesCubit() : super(ThemesInitial());
  void toggletheme() {
    if (state is ThemesInitial) {
      emit(DarkThemesState());
    } else {
      emit(LightThemesState());
    }
  }
}
