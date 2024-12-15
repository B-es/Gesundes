import 'package:gesundes/api/models/dish_model.dart';
import 'package:gesundes/api/models/ingredient_model.dart';

class DishesRep {
  List<DishModel> dishes = [
    DishModel(
        name: "Чечевичный суп",
        description:
            "Чечевичный суп — это питательное и ароматное блюдо, которое идеально подходит для здорового питания. Для его приготовления вам понадобятся следующие ингредиенты: чечевица, лук, морковь, сельдерей и овощной бульон.\nЧечевичный суп богат белками, клетчаткой и витаминами, что делает его отличным выбором для рациона при гипертонии. Он также имеет приятный вкус и легко готовится.",
        isFavorite: false,
        img: 'assets/images/chechya.jpg',
        recipe: """Промойте чечевицу под проточной водой.
Нарежьте лук, морковь и сельдерей кубиками. Если используете чеснок, мелко порубите его.
В кастрюле разогрейте овощной бульон или воду. Добавьте чечевицу и варите на среднем огне около 15 минут, пока чечевица не станет мягкой.
Обжарьте лук, морковь и сельдерей на сковороде до мягкости.
Добавьте обжаренные овощи в кастрюлю с чечевицей.
Приправьте суп солью, чёрным перцем, паприкой, кумином, кориандром и другими специями по вкусу. Варите ещё 5–10 минут.
Подавайте суп горячим, добавив лимонный сок и свежую зелень по вкусу.""",
        ingredients: [
          const IngredientModel(name: "Чечевица", unit: "г", count: 200),
          const IngredientModel(name: "Вода", unit: "л", count: 1),
          const IngredientModel(name: "Лук репчатый", unit: "шт", count: 1),
          const IngredientModel(name: "Морковь", unit: "шт", count: 2),
        ]),
    DishModel(
        name: "Запечённая курица с овощами",
        description:
            """Запечённая курица с овощами — это полезное и питательное блюдо, которое сочетает в себе нежное куриное мясо и сочные овощи. Благодаря запеканию в духовке курица и овощи сохраняют свои полезные свойства и приобретают неповторимый вкус.
Это блюдо идеально подходит для тех, кто следит за своим здоровьем и хочет питаться правильно. Оно богато белками, витаминами и минералами, которые необходимы для поддержания здоровья организма.""",
        isFavorite: false,
        img: 'assets/images/zapechenchicken.jpg',
        recipe: """
Промойте куриное филе и нарежьте его небольшими кусочками.
Нарежьте овощи: брокколи и цветную капусту разделите на соцветия, морковь нарежьте кружочками, лук — полукольцами. Если используете чеснок, мелко порубите его.
Смешайте оливковое масло, соль, чёрный перец, сладкую паприку, куркуму и другие специи по вкусу. Замаринуйте в этой смеси курицу и овощи на 30 минут.
Разогрейте духовку до 180 градусов Цельсия. Выложите курицу и овощи в форму для запекания и отправьте в духовку на 40–50 минут, пока курица не станет золотистой, а овощи мягкими.
Подавайте запечённую курицу с овощами горячей, добавив лимонный сок и свежую зелень по вкусу.""",
        ingredients: [
          const IngredientModel(name: "Куриное филе", unit: "г", count: 200),
          const IngredientModel(name: "Брокколи", unit: "г", count: 300),
          const IngredientModel(name: "Цветная капуста", unit: "г", count: 300),
          const IngredientModel(name: "Морковь", unit: "шт", count: 2),
          const IngredientModel(name: "Лук репчатый", unit: "шт", count: 1),
          const IngredientModel(
              name: "Оливковое масло", unit: "ст. л", count: 1),
        ]),
    DishModel(
        name: "Овощное рагу с кабачками и баклажанами",
        description: """
Овощное рагу с кабачками и баклажанами — это лёгкое, но сытное блюдо, которое сочетает в себе пользу свежих овощей. Оно идеально подходит для здорового питания, так как содержит много витаминов, минералов и клетчатки.
Это рагу имеет приятный вкус и аромат, а также привлекательный внешний вид благодаря ярким цветам овощей. Его можно подавать как самостоятельное блюдо или в качестве гарнира к мясу или рыбе.
""",
        isFavorite: true,
        img: 'assets/images/baklazan.jpeg',
        recipe: """
Промойте овощи. Нарежьте их кубиками: кабачки, баклажаны, морковь, сладкий перец. Лук нарежьте полукольцами. Если используете чеснок, мелко порубите его.
Разогрейте сковороду с оливковым маслом. Обжарьте лук и морковь до мягкости.
Добавьте баклажаны и кабачки на сковороду и обжаривайте ещё 5–7 минут.
Затем добавьте сладкий перец и специи по вкусу. Перемешайте и тушите под крышкой на медленном огне 15–20 минут, пока овощи не станут мягкими.
В конце приготовления добавьте измельчённый чеснок и свежую зелень по вкусу. Дайте настояться под крышкой 5 минут.
Подавайте овощное рагу горячим, украсив свежей зеленью.""",
        ingredients: [
          const IngredientModel(name: "Кабачки", unit: "шт", count: 2),
          const IngredientModel(name: "Баклажаны ", unit: "шт", count: 2),
          const IngredientModel(name: "Сладкий перец", unit: "шт", count: 3),
          const IngredientModel(name: "Морковь", unit: "шт", count: 2),
          const IngredientModel(name: "Лук репчатый", unit: "шт", count: 1),
          const IngredientModel(
              name: "Оливковое масло", unit: "ст. л", count: 1),
        ]),
  ];
}
