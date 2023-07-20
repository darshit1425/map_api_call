import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_api_call/post_provider.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
      },
    ),
  ));
}
