import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));

    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => GestureDetector(
          onTap: _onTapSwitch,
          child: Container(
            width: 50.0,
            height: 28.0,
            decoration: _decoration(),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: kPrimaryColor),
                  child: Icon(
                    widget.value
                        ? Icons.dark_mode_rounded
                        : Icons.light_mode_rounded,
                    size: 14,
                    color: widget.value ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  BoxDecoration _decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(24.0),
      color: _circleAnimation.value == Alignment.centerRight
          ? Colors.white
          : Colors.black,
    );
  }

  void _onTapSwitch() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    debugPrint("_animationController: ${_animationController.isCompleted}");
    widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
  }
}
