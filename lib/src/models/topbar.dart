import 'package:flutter/material.dart';

class CustomTopbar extends StatelessWidget {
  final int selectedPage;

  const CustomTopbar({super.key, required this.selectedPage});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldState,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 70),
        child: size.width > 800
            ? LargeTopbar(selectedPage: selectedPage)
            : MiniTopbar(state: _scaffoldState.currentState),
      ),
      drawer: const NavDrawer(),
    );
  }
}

class LargeTopbar extends StatelessWidget {
  const LargeTopbar({super.key, required this.selectedPage});

  final int selectedPage;

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
          const Title(),
          Expanded(child: SizedBox(width: size.width / 10)),
          TopbarButton(
            title: "About",
            onTap: () => Navigator.pushNamed(context, '/about'),
            isSelected: selectedPage - 1,
          ),
          TopbarButton(
            title: "Ratings",
            onTap: () => Navigator.pushNamed(context, '/ratings'),
            isSelected: selectedPage - 2,
          ),
          TopbarButton(
            title: "Events",
            onTap: () => Navigator.pushNamed(context, '/events'),
            isSelected: selectedPage - 3,
          ),
          TopbarButton(
            title: "Contact Us",
            onTap: () => Navigator.pushNamed(context, '/contact'),
            isSelected: selectedPage - 4,
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
  final int isSelected;

  const TopbarButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  State<TopbarButton> createState() => _TopbarButtonState();
}

class _TopbarButtonState extends State<TopbarButton> {
  late var color = widget.isSelected == 0
      ? const Color.fromARGB(255, 25, 25, 25)
      : const Color.fromARGB(255, 0, 0, 0);
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: InkWell(
              hoverColor: color,
              onHover: (value) {
                setState(() {
                  _isHovering = value;
                });
              },
              splashFactory: NoSplash.splashFactory,
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

class MiniTopbar extends StatelessWidget {
  final ScaffoldState? state;

  const MiniTopbar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: 70,
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                state!.openDrawer();
              },
              child: const Icon(Icons.menu, color: Colors.yellow),
            ),
          ),
          Expanded(child: SizedBox(width: size.width / 8)),
          const Title(),
          Expanded(child: SizedBox(width: size.width / 8)),
          const Expanded(child: SizedBox(width: 20)),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Row(children: [
        Spacer(),
        Column(
          children: [NavDrawerItem()],
        ),
        Spacer()
      ]),
    );
  }
}

class NavDrawerItem extends StatelessWidget {
  const NavDrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(shape: RoundedRectangleBorder()),
      child: const InkResponse(child: Text("Home")),
    );
  }
}
