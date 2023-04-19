import 'package:flutter/material.dart';
import 'package:shrevemovieclub_website/src/pages/events.dart';

class CustomTopbar extends StatelessWidget {
  const CustomTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: 70,
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(child: SizedBox(width: size.width / 8)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Purdue Shreve",
                style: TextStyle(
                  color: Colors.yellow[500],
                  fontSize: 26,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
              Text(
                "Movie Club",
                style: TextStyle(
                  color: Colors.yellow[500],
                  fontSize: 26,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
          Expanded(child: SizedBox(width: size.width / 10)),
          TopbarButton(
            title: "About",
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          TopbarButton(
            title: "Ratings",
            onTap: () => Navigator.pushNamed(context, '/ratings'),
          ),
          TopbarButton(
            title: "Events",
            onTap: () => Navigator.pushNamed(context, '/events'),
          ),
          TopbarButton(
            title: "Contact Us",
            onTap: () => Navigator.pushNamed(context, '/contact'),
          ),
          Expanded(child: SizedBox(width: size.width / 8)),
        ],
      ),
    );
  }
}

class TopbarButton extends StatefulWidget {
  final String title;
  final Function() onTap;
  const TopbarButton({super.key, required this.title, required this.onTap});

  @override
  State<TopbarButton> createState() => _TopbarButtonState();
}

class _TopbarButtonState extends State<TopbarButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: InkWell(
              hoverColor: Colors.black,
              onHover: (value) {
                setState(() {
                  _isHovering = value;
                });
              },
              onTap: widget.onTap,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    widget.title,
                    style: const TextStyle(color: Colors.yellow),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: _isHovering,
            child: Container(height: 4, width: 80, color: Colors.yellow),
          )
        ],
      ),
    );
  }
}
