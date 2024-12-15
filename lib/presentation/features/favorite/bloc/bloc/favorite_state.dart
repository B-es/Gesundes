part of 'favorite_bloc.dart';

sealed class FavoriteState {
  const FavoriteState();
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoaded extends FavoriteState {
  final List<DishModel> dishes;
  final List<bool> isEnoughs;

  const FavoriteLoaded({required this.dishes, required this.isEnoughs});
}
