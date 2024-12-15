import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/api/repositories/dishes_rep.dart';
import 'package:gesundes/api/repositories/ingredient_rep.dart';
import 'package:gesundes/presentation/common/cubit/cubit/recommendation_cubit.dart';
import 'package:gesundes/presentation/features/auth/auth.dart';
import 'package:gesundes/presentation/features/choosing_dishes/preference_choose/cubit/cubit/preference_cubit.dart';
import 'package:gesundes/presentation/features/ingredient_list/cubit/cubit/ingredient_cubit.dart';
import 'package:gesundes/presentation/features/main_screen/main_screen.dart';
import 'presentation/features/favorite/bloc/bloc/favorite_bloc.dart';
import 'presentation/features/library/bloc/bloc/library_bloc.dart';
import 'presentation/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    const bool isLogged = false;

    final dishesRep = DishesRep();
    final ingredientRep = IngredientRep();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LibraryBloc(dishesRep: dishesRep, ingredientRep: ingredientRep)
                ..add(LoadLibraryEvent()),
        ),
        BlocProvider(
          create: (context) =>
              FavoriteBloc(dishesRep: dishesRep, ingredientRep: ingredientRep)
                ..add(LoadFavoriteEvent()),
        ),
        BlocProvider(
          create: (context) =>
              RecommendationCubit(dishesRep: dishesRep)..getRecommendation(),
        ),
        BlocProvider(
          create: (context) =>
              IngredientCubit(ingredientRep: ingredientRep)..loadIngredient(),
        ),
        BlocProvider(
          create: (context) =>
              PreferenceCubit(dishesRep: dishesRep)..next(false),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: dishesRep),
          RepositoryProvider.value(value: ingredientRep),
        ],
        child: MaterialApp(
          title: 'Gesundes',
          debugShowCheckedModeBanner: false,
          theme: getLightTheme(),
          home: isLogged ? MainScreen() : Auth(),
        ),
      ),
    );
  }
}
