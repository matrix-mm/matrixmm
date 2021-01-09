import 'package:flutter/material.dart';
import 'package:matrixmm/pages/product_page.dart';
import 'package:matrixmm/provider/products_provider.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProductProvider(),
            child: ProductPage(),
          )
        ],
        child: MaterialApp(
          title: 'MATRiX OnlineShop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.white,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              elevation: 0,
              foregroundColor: Colors.white,
            ),
            accentColor: Colors.indigoAccent,
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 22.0, color: Colors.black12),
              headline2: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.indigoAccent,
              ),
            ),
          ),
          home: HomePage(),
        ));
  }
}
