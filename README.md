# Sizzle Recipe App

Sizzle is a feature-rich recipe app designed to make cooking simple and enjoyable. Browse a variety of recipes, view detailed instructions, and save your favorite recipes for easy access. This repository contains the source code for the Sizzle app built with Flutter.

## Features

Recipe Browsing: Discover new recipes from a wide range of cuisines.

Detailed Instructions: View step-by-step instructions and ingredients for each recipe.

Filter: Filter by breakfast, lunch, dinner, snacks, amd drinks.

## Installation

Clone the repository:
```
git clone https://github.com/yourusername/sizzle-recipe-app.git

cd sizzle-recipe-app
```
Install dependencies:
 ```
flutter pub get
```
Run the app:
```
flutter run

```
## Usage

Once you have the app running, you can:

Browse the list of available recipes on the home screen.
Tap on a recipe to view detailed instructions and ingredients.
Filter by breakfast, lunch, dinner, snack, or drinks.

## Api Integration

Sizzle uses the DummyJson API to fetch recipe data, enhancing the app's functionality by providing multiple recipe suggestions.

```
class HTTPService {
  static final HTTPService _singleton = HTTPService._internal();
  final _dio = Dio();
  factory HTTPService() {
    return _singleton;
  }
  HTTPService._internal() {
    setup();
  }
  Future<void> setup({String? bearerToken}) async {
    final headers = {
      "Content-Type": "application/json",
    };
    if (bearerToken != null) {
      headers["Authorization"] = "Bearer $bearerToken";
    }
    final options = BaseOptions(
        baseUrl: API_BASE_URL,
        headers: headers,
        validateStatus: (status) {
          if (status == null) return false;
          return status < 500;
        });
    _dio.options = option
```

![sizzle1](https://github.com/Mofolasayo/Sizzle/assets/115883934/cf6a2834-1587-4a57-9536-d2b82e3d09e3)
![sizzle2](https://github.com/Mofolasayo/Sizzle/assets/115883934/d07cdd4c-c301-4413-bc62-e3b5a6921061)
![sizzle3](https://github.com/Mofolasayo/Sizzle/assets/115883934/597cfaeb-8d86-4e2e-a797-677c2c765aaa)
![sizzle4](https://github.com/Mofolasayo/Sizzle/assets/115883934/ee7d2844-59a5-43a6-ae8b-12d1d756d7ae)






