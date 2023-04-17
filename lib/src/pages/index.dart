import 'package:flutter/material.dart';
import 'package:shrevemovieclub_website/src/models/navbar.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
      ),
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
        height: 70,
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
