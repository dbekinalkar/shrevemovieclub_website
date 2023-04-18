import 'package:flutter/material.dart';

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
            onTap: () {},
          ),
          TopbarButton(
            title: "Ratings",
            onTap: () {},
          ),
          TopbarButton(
            title: "Events",
            onTap: () {},
          ),
          TopbarButton(
            title: "Contact Us",
            onTap: () {},
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Text(widget.title,
                    style: const TextStyle(
                      color: Colors.yellow,
                    )),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: _isHovering,
                  child: Container(height: 2, width: 20, color: Colors.yellow),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
