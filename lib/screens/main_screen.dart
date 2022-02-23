import 'package:com_nico_develop_relax/screens/calm_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final double height;
  const MainScreen({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _visible = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(
          seconds: 1,
        ), () {
      if (mounted) {
        setState(() => _visible = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _visible = !_visible);

        Future.delayed(
            const Duration(
              seconds: 3,
            ), () {
          if (mounted) {
            setState(() => _visible = false);
          }
        });
      },
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
            fit: BoxFit.cover,
          ),
          CalmScreen(
            height: widget.height,
          ),
          Positioned(
            bottom: 30.0,
            child: AnimatedOpacity(
              duration: const Duration(
                milliseconds: 500,
              ),
              opacity: _visible ? 1 : 0,
              child: const Icon(
                Icons.keyboard_arrow_up_rounded,
                color: Colors.white,
                size: 80.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
