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
        child: CustomTopbar(),
      ),
    );
    /*return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 55),
        child: Topbar(),
      ),
    );*/
  }
}

class Topbar extends StatelessWidget {
  const Topbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.orange[500],
      leading: const CircleAvatar(
        foregroundImage: AssetImage("images/logo.png"),
        backgroundColor: Colors.black,
      ),
      title: Text("Purdue Shreve Movie Club"),
      actions: const <ActionButton>[
        ActionButton(
          title: "About Us",
        ),
        ActionButton(
          title: "Ratings",
        ),
        ActionButton(
          title: "Events",
        ),
        ActionButton(
          title: "Contact Us",
        ),
      ],
    );
  }
}

class ActionButton extends StatefulWidget {
  final String title;
  const ActionButton({
    super.key,
    required this.title,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  late bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onHover: (value) {
        setState(() {
          _isHovering = value;
        });
      },
      onPressed: () {
        debugPrint('h');
      },
      child: Container(
        color: _isHovering ? Colors.orange[300] : Colors.orange[500],
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
