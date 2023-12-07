import 'package:flutter/widgets.dart';

class MyVariables {
  static const String pathToBackGroundBlue = 'assets/png/background_blue.png';
  static const String strName = 'Полное имя';
  static const String strEmail = 'Email';
  static const String strPassword = 'Пароль';
  static const String strConfirmPassword = 'Подтвердите ароль';
  static const String strAcquainted = 'Привет! \n Давай знакомиться';
  static const String strChangeLanguage = 'Сменить язык';
  static const String strNoAccountSignUp =
      'У Вас нет аккаунта? Зарегестрироваться';
  static const String strSignIn = 'Войти';
  static const String strLoginToContinue = 'Войдите чтобы продолжить';
  static const String strSignUp = 'Зарегестрироваться';
  static const String strAlreadyHaveAccount = 'Уже есть аккаунт?';

  final List restaurants = ["Baking Express"]; // Изменил имя ресторана
  final restImg = ["assets/png/logo.jpg"];

  final List shops = ["FastFood"];
  final shopImg = ["assets/png/pie.jpg"];

  final List foodNameBakingExpress = [
    "Новое блюдо 1",
    "Новое блюдо 2",
    "Новое блюдо 3",
    "Новое блюдо 4",
    "Новое блюдо 5",
    "Новое блюдо 6",
    "Новое блюдо 7"
  ];
  final List foodImagesBakingExpress = [
    "assets/png/2.jpg",
    "assets/png/2.jpg",
    "assets/png/2.jpg",
    "assets/png/pie.jpg",
    "assets/png/2.jpg",
    "assets/png/2.jpg",
    "assets/png/2.jpg"
  ];
  final List foodPriceBakingExpress = [
    "50 руб",
    "55 руб",
    "60 руб",
    "65 руб",
    "70 руб",
    "75 руб",
    "80 руб"
  ];

  final List drinkNameBakingExpress = [
    "Чай чёрный",
    "Морс клюквенный",
    "Чай зелёный"
  ];
  final List drinkImagesBakingExpress = [
    "assets/png/teaBlack.jpg",
    "assets/png/morse.jpg",
    "assets/png/teaGreen.jpg"
  ];
  final List drinkPriceBakingExpress = ["30 руб", "70 руб", "35 руб"];

  Map<String, Map<String, List<String>>> shopItemsMap = {
    "Baking Express": {
      "foodNames": [
        "Новое блюдо 1",
        "Новое блюдо 2",
        "Новое блюдо 3",
        "Новое блюдо 4",
        "Новое блюдо 5",
        "Новое блюдо 6",
        "Новое блюдо 7"
      ],
      "foodImages": [
        "assets/png/2.jpg",
        "assets/png/pie.jpg",
        "assets/png/2.jpg",
        "assets/png/2.jpg",
        "assets/png/2.jpg",
        "assets/png/2.jpg",
        "assets/png/2.jpg"
      ],
      "foodPrices": [
        "50 руб",
        "55 руб",
        "60 руб",
        "65 руб",
        "70 руб",
        "75 руб",
        "80 руб"
      ],
      "drinkNames": [
        "Чай чёрный",
        "Морс клюквенный",
        "Чай зелёный"
      ],
      "drinkImages": [
        "assets/png/teaBlack.jpg",
        "assets/png/morse.jpg",
        "assets/png/teaGreen.jpg"
      ],
      "drinkPrices": ["30 руб", "70 руб", "35 руб"],
    },
    "FastFood": {
      "foodNames": [
        "Шаурма",
        "Гамбургер",
        "Картошка фри",
        "Газировка",
        "Хот-дог",
      ],
      "foodImages": [
        "assets/png/pie.jpg",
        "assets/png/pie.jpg",
        "assets/png/pie.jpg",
        "assets/png/pie.jpg",
        "assets/png/pie.jpg",
      ],
      "foodPrices": ["100 руб", "120 руб", "50 руб", "30 руб", "80 руб"],
      "drinkNames": ["Кола", "Пепси", "Фанта"],
      "drinkImages": [
        "assets/png/pie.jpg",
        "assets/png/pie.jpg",
        "assets/png/pie.jpg",
      ],
      "drinkPrices": ["40 руб", "40 руб", "45 руб"],
    },
    // Другие магазины...
  };

  String getFoodImage(String shopName, int index) {
    return shopItemsMap[shopName]?["foodImages"]?[index] ?? defaultFoodImage;
  }

  String getFoodPrice(String shopName, int index) {
    return shopItemsMap[shopName]?["foodPrices"]?[index] ?? defaultFoodPrice;
  }

  String getDrinkImage(String shopName, int index) {
    return shopItemsMap[shopName]?["drinkImages"]?[index] ?? defaultDrinkImage;
  }

  String getDrinkPrice(String shopName, int index) {
    return shopItemsMap[shopName]?["drinkPrices"]?[index] ?? defaultDrinkPrice;
  }


  String get defaultFoodImage => "assets/default_food_image.jpg";
  String get defaultFoodPrice => "0 руб";
  String get defaultDrinkImage => "assets/default_drink_image.jpg";
  String get defaultDrinkPrice => "0 руб";
}
