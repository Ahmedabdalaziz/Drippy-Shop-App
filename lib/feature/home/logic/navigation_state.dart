part of 'navigation_cubit.dart';

@immutable
sealed class NavigationState {
  const NavigationState();
}

final class NavigationInitial extends NavigationState {}

final class NavigationTabSelected extends NavigationState {
  final int currentIndex;

  const NavigationTabSelected(this.currentIndex);
}
