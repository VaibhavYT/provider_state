import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/multi_pro_screen.dart';
import 'package:provider_state/provider/cout_provider.dart';
import 'package:provider_state/provider/favourite_provider.dart';
import 'package:provider_state/provider/slider_provider.dart';
import 'package:provider_state/provider/theme_provider.dart';
import 'package:provider_state/screens/fav_list_pro.dart';
import 'package:provider_state/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeModeProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeModeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.amber,
              
              appBarTheme:const  AppBarTheme(
                backgroundColor: Colors.green,
              )
            ),
            
            
            home: FavouriteScreen(),
          );
        },
      ),
    );
  }
}
