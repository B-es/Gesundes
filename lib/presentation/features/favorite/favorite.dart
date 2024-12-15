import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/presentation/common/appbar_custom.dart';
import 'package:gesundes/presentation/common/info_dish_card.dart';
import 'package:gesundes/presentation/common/search.dart';
import 'package:gesundes/presentation/features/favorite/bloc/bloc/favorite_bloc.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBarCustom(
        toolbarHeight: 200,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Search(bloc: BlocProvider.of<FavoriteBloc>(context)),
              ),
              SizedBox(
                width: width - 40,
                child: Divider(
                  color: themeData.primaryColor,
                ),
              ),
            ],
          ),
        ),
        title: Text(
          softWrap: true,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
          "избранные блюда".toUpperCase(),
          style: themeData.textTheme.titleMedium,
        ),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoaded) {
            final dishes = state.dishes;
            final isEnoughs = state.isEnoughs;
            return ListView.separated(
                controller: ScrollController(),
                itemBuilder: (ctx, i) =>
                    InfoDishCard(dish: dishes[i], isEnough: isEnoughs[i]),
                separatorBuilder: (ctx, i) => const SizedBox(
                      height: 5,
                    ),
                itemCount: dishes.length);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
