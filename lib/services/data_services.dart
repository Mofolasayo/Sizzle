import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/services/https_service.dart';

class DataService {
  static final DataService _singleton = DataService._internal();
  final HTTPService _httpService = HTTPService();

  factory DataService() {
    return _singleton;
  }

  DataService._internal();
  Future<List<Recipe>?> getRecipes(String mealFilter) async {
    String path = "recipes/";
    if (mealFilter.isNotEmpty) {
      path += "meal-type/$mealFilter";
    }
    var response = await _httpService.get(path);
    if (response?.statusCode == 200 && response?.data != null) {
      List data = response!.data["recipes"];
      List<Recipe> recipes = data.map((e) => Recipe.fromJson(e)).toList();
      return recipes;
    }
  }
}
