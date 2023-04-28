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
        child: const CustomTopbar(selectedPage: 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 66.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  ' We show movies that are culturally inclusive and factually accurate. This will add to the continuous learning and cultural intelligence of all who view our movies. Some examples of this are our planned movies. Our first movie we plan to watch is Knives Out, which shatters racist undertones with the main character Marta. This, in conjunction with the extreme inclusivity of our group shows that we have cultural intelligence and inclusion. We also potentially plan to watch Bollywood movies (i.e. Kutch Kutch Hota Hai) and modern historical dramas (i.e. All Quiet On The Western Front). Through this we hope to teach and inspire people all while having a fun time watching movies.',
                  style: TextStyle(fontSize: 24, height: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
