import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesflo_project/settings_cubit/cubit/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  // initialsed parent with theme data
  SettingCubit(): super(SettingState(theme: ThemeData.light()));

  // created method which will update the state
  // first check if the theme is light or dark
  // if theme is light than it will going to emit a new state with dark theme
  // else we will make it light

  // state needs to be updated whenever the toggleTheme method is called
  // update state is the new state

  void toggleTheme() {
    if(state.theme == ThemeData.light()) {
      final updateState = SettingState(theme: ThemeData.dark());
      emit(updateState);
    } else {
      final updateState = SettingState(theme: ThemeData.light());
      emit(updateState);
    }
  }

}