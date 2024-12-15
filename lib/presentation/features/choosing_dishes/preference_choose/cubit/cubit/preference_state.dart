part of 'preference_cubit.dart';

sealed class PreferenceState {
  const PreferenceState();
}

final class PreferenceInitial extends PreferenceState {}

final class PreferenceOne extends PreferenceState {
  final DishModel dish;
  const PreferenceOne({required this.dish});
}

final class PreferenceAll extends PreferenceState {
  final List<DishModel> dishes;
  const PreferenceAll({required this.dishes});
}
