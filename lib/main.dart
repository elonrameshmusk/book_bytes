import 'package:flutter/material.dart';
import 'package:bb/views/components/navbar_layout.dart';
import 'package:bb/views/components/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: colors['surface'],
            iconTheme:
                IconThemeData(color: colors['on_surface_variant'], size: 25.0),
            titleTextStyle: TextStyle(
              color: colors['on_surface'],
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: colors['primary_container'],
              iconSize: 25.0,
              foregroundColor: colors['on_primary_container']),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: colors['surface'],

            selectedIconTheme: IconThemeData(
              size: 25.0,
              color: colors['on_secondary_container'],
            ),
            selectedItemColor: colors['on_secondary_container'],
            selectedLabelStyle: TextStyle(
              color: colors['on_surface'],
            ),
            unselectedIconTheme:
                IconThemeData(size: 25.0, color: colors['on_surface_variant']),
            unselectedItemColor: colors['on_surface_variant'],
            unselectedLabelStyle: TextStyle(
              color: colors['on_surface_variant'],
            ),
          ),
          iconTheme: const IconThemeData(
            size: 25.0
          ),
          useMaterial3: true),
      home: const BottomNavbarLayout(),
    );
  }
}
