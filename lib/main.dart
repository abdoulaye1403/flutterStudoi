import 'package:flutter/material.dart';
import 'package:test_flutter/recipeScreen.dart';
import 'package:test_flutter/recipeListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        theme: ThemeData(
          primarySwatch: Colors.red,
        ));
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => RecipeListScreen());
      case '/recipe':
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                RecipeScreen(recipe: settings.arguments),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(curve: Curves.ease, parent: animation);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                appBar: AppBar(title: Text("Error"), centerTitle: true),
                body: Center(
                  child: Text("Page not found"),
                )));
    }
  }
}
