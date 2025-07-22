// lib/core/cubit/navigation_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationTabSelected(0));

  void selectTab(int index) {
    if (state is NavigationTabSelected &&
        (state as NavigationTabSelected).currentIndex != index) {
      emit(NavigationTabSelected(index));
    } else if (state is NavigationInitial) {
      emit(NavigationTabSelected(index));
    }
  }
}
