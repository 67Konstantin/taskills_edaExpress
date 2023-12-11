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
  final restImg = ["https://sun9-80.userapi.com/impf/c845017/v845017148/11ab81/XXCzz5NJkWI.jpg?size=604x488&quality=96&sign=c057c008dc5b28dfa0b46059e02b608a&type=album"];

  final List shops = ["FastFood"];
  final shopImg = ["https://image.similarpng.com/very-thumbnail/2020/04/fast-food-logo-emblem.png"];

  Map<String, Map<String, List<String>>> shopItemsMap = {
    "Baking Express": {
      "foodNames": [
        "Классическая булка",
        "Булочка с маком",
        "Булочка с изюмом",
        "Булка с кунжутом",
        "Крендель с корицей",
        "Французский багет",
        "Булочка с шоколадной начинкой"
      ],
      "foodImages": [
        "https://capucino.ru/assets/images/products/2523/1122.jpg",
        "https://main-cdn.sbermegamarket.ru/hlr-system/-28/464/235/672/821/7/100028797570b0.jpg",
        "https://main-cdn.sbermegamarket.ru/hlr-system/519/090/896/451/054/100031005813b0.jpg",
        "https://5armia.ru/pic/5c56e338209fa52fcbb68dba2760c1c1.jpg",
        "https://kokshetau.avokado.kz/upload/iblock/c33/c33963989a28057a2ee68ce5e76c599a.jpg",
        "https://irecommend.ru/sites/default/files/product-images/2542697/7KEh3PFyfxgNgCsEW7g.jpg",
        "http://klublady.ru/uploads/posts/2022-02/1644704566_30-klublady-ru-p-bulochka-s-makom-i-shokoladnoi-glazuryu-fo-37.jpg"
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
        "https://avatars.mds.yandex.net/get-mpic/5238069/img_id289080732646376821.jpeg/14hq",
        "https://nagor-shop.ru/wp-content/uploads/2020/05/mors-klyukv.jpg",
        "https://uvape.pro/image/cache/catalog/image/catalog/pods/inflave/inflave-pods-logic-greentea-2.webp"
      ],
      "drinkPrices": ["30 руб", "70 руб", "35 руб"],
    },
    "FastFood": {
      "foodNames": [
        "Шаурма",
        "Гамбургер",
        "Картошка фри",
        "Хот-дог",
      ],
      "foodImages": [
        "https://static.tildacdn.com/tild3037-3165-4432-b437-353636356339/pngwingcom_5.jpg",
        "https://main-cdn.sbermegamarket.ru/hlr-system/-16/017/136/771/181/559/100029622423b0.jpg",
        "https://pizza-papa.ru/upload/iblock/62e/62e40f04675539e2fcccf0e0d748832f.jpg",
        "https://cojo.ru/wp-content/uploads/2022/12/khot-dog-longer-3.webp",
      ],
      "foodPrices": ["100 руб", "120 руб", "50 руб", "80 руб"],
      "drinkNames": ["Кола", "Пепси", "Фанта"],
      "drinkImages": [
        "https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/b0998a26210243.563531caac4f7.png",
        "https://img.razrisyika.ru/kart/109/435869-pepsi-30.jpg",
        "https://eng.kupimir.club/upload/iblock/ab5/ab521800dc6294f8b2fca3be896aa92c.png",
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


  String get defaultFoodImage => "https://cojo.ru/wp-content/uploads/2022/12/khot-dog-longer-3.webp";
  String get defaultFoodPrice => "0 руб";
  String get defaultDrinkImage => "https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/b0998a26210243.563531caac4f7.png";
  String get defaultDrinkPrice => "0 руб";



  static List basketName = [];
  static List basketPrice = [];
  static int basketAllPrice = 0;
}
