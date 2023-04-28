import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:shrevemovieclub_website/src/pages/about.dart';
import 'package:shrevemovieclub_website/src/pages/contact.dart';
import 'package:shrevemovieclub_website/src/pages/events.dart';
import 'package:shrevemovieclub_website/src/pages/ratings.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shreve Movie Club Website',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route<dynamic>? _onGenerateRoute(settings) {
    switch (settings.name) {
      case '/about':
        return buildRoute(settings, const AboutPage());
      case '/ratings':
        return buildRoute(settings, const RatingPage());
      case '/events':
        return buildRoute(settings, const EventPage());
      case '/contact':
        return buildRoute(settings, const ContactPage());
      default:
        return buildRoute(settings, const AboutPage());
    }

    // Unknown route
    return MaterialPageRoute(builder: (_) => const AboutPage());
  }

  PageRouteBuilder<dynamic> buildRoute(RouteSettings settings, var page) {
    return PageRouteBuilder(
      settings:
          settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
      pageBuilder: (_, __, ___) => page as StatelessWidget,
    );
  }
}
