import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  // Implement fromJson
  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    final themeIndex = json['theme'] as int?;
    if (themeIndex != null) {
      return ThemeMode.values[themeIndex]; // Convert index back to ThemeMode
    }
    return ThemeMode.system; // Default value
  }

  // Implement toJson
  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme': state.index}; // Convert ThemeMode to its index
  }
}
