part of 'library_bloc.dart';

sealed class LibraryState {
  const LibraryState();
}

final class LibraryInitial extends LibraryState {}

final class LibraryLoaded extends LibraryState {
  final List<DishModel> dishes;

  const LibraryLoaded({required this.dishes});
}
