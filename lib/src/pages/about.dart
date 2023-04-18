import 'package:flutter/material.dart';
import 'package:shrevemovieclub_website/src/models/topbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 70),
        child: const CustomTopbar(),
      ),
      body: Text('About'),
    );
  }
}
