part of 'recommendation_cubit.dart';

sealed class RecommendationState {
  const RecommendationState();
}

final class RecommendationInitial extends RecommendationState {}

final class RecommendationLoaded extends RecommendationState {
  final DishModel dish;

  const RecommendationLoaded({required this.dish});
}
