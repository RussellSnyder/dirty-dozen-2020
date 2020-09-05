library foods;

import '../models/Food.dart';

final Food strawberries = Food('strawberries', 'Strawberries', FoodCategory.dirty, 'strawberries.jpg', true);
final Food spinach = Food('spinach', 'Spinach', FoodCategory.dirty, 'spinach.jpg', false);
final Food kale = Food('kale', 'Kale', FoodCategory.dirty, 'kale.jpg', false);
final Food nectarines = Food('nectarines', 'Nectarines', FoodCategory.dirty, 'nectarines.jpg', true);
final Food apples = Food('apples', 'Apples', FoodCategory.dirty, 'apples.jpg', true);
final Food grapes = Food('grapes', 'Grapes', FoodCategory.dirty, 'grapes.jpg', true);
final Food peaches = Food('peaches', 'Peaches', FoodCategory.dirty, 'peaches.jpg', true);
final Food cherries = Food('cherries', 'Cherries', FoodCategory.dirty, 'cherries.jpg', true);
final Food pears = Food('pears', 'Pears', FoodCategory.dirty, 'pears.jpg', true);
final Food tomatoes = Food('tomatoes', 'Tomatoes', FoodCategory.dirty, 'tomatoes.jpg', true);
final Food celery = Food('celery', 'Celery', FoodCategory.dirty, 'celery.jpg', false);
final Food potatoes = Food('potatoes', 'Potatoes', FoodCategory.dirty, 'potatoes.jpg', true);
final Food avocados = Food('avocados', 'Avocados', FoodCategory.clean, 'avocados.jpg', true);
final Food sweetCorn = Food('sweetCorn', 'Sweet Corn', FoodCategory.clean, 'corn.jpg', false);
final Food pineapple = Food('pineapple', 'pineapple', FoodCategory.clean, 'pineapple.jpg', true);
final Food onions = Food('onions', 'Onions', FoodCategory.clean, 'onions.jpg', true);
final Food papaya = Food('papaya', 'Papaya', FoodCategory.clean, 'papaya.jpg', false);
final Food sweetPeas = Food('sweetPeas', 'Sweet Peas', FoodCategory.clean, 'peas.jpg', true);
final Food eggplant = Food('eggplant', 'Eggplant', FoodCategory.clean, 'eggplant.jpg', false);
final Food asparagus = Food('asparagus', 'Asparagus', FoodCategory.clean, 'asparagus.jpg', false);
final Food cauliflower = Food('cauliflower', 'Cauliflower', FoodCategory.clean, 'cauliflower.jpg', false);
final Food cantaloupe = Food('cantaloupe', 'Cantaloupe', FoodCategory.clean, 'cantaloupe.jpg', false);
final Food broccoli = Food('broccoli', 'Broccoli', FoodCategory.clean, 'broccoli.jpg', false);
final Food mushrooms = Food('mushrooms', 'Mushrooms', FoodCategory.clean, 'mushrooms.jpg', true);
final Food cabbage = Food('cabbage', 'Cabbage', FoodCategory.clean, 'cabbage.jpg', false);
final Food honeydew = Food('honeydew', 'Honeydew Melon', FoodCategory.clean, 'honeydew.jpg', false);
final Food kiwi = Food('kiwi', 'Kiwi', FoodCategory.clean, 'kiwi.jpg', false);


final List<Food> dirtyFoods = [
  strawberries,
  spinach,
  kale,
  nectarines,
  apples,
  grapes,
  peaches,
  cherries,
  pears,
  tomatoes,
  celery,
  potatoes,
];

final List<Food> cleanFoods = [
  avocados,
  sweetCorn,
  pineapple,
  onions,
  papaya,
  sweetPeas,
  eggplant,
  asparagus,
  cauliflower,
  cantaloupe,
  broccoli,
  mushrooms,
  cabbage,
  honeydew,
  kiwi,
];