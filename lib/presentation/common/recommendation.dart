import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/presentation/common/cubit/cubit/recommendation_cubit.dart';
import 'package:gesundes/presentation/common/star_dish_card.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final width_ = width ?? MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: width_ - 40,
          child: Divider(
            color: themeData.primaryColor,
          ),
        ),
        Text(
          softWrap: true,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
          "Рекомендация на сегодня",
          style: themeData.textTheme.titleMedium,
        ),
        BlocBuilder<RecommendationCubit, RecommendationState>(
          builder: (context, state) {
            if (state is RecommendationLoaded)
              return StarDishCard(
                dish: state.dish,
              );
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        SizedBox(
          width: width_ - 40,
          child: Divider(
            color: themeData.primaryColor,
          ),
        ),
      ],
    );
  }
}
