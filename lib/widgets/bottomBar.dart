import 'package:ecommerce/widgets/gradient.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BottomBar extends StatefulWidget {
  final List<List> screens;
  final Function(int) setIndex;
  final int index;
  const BottomBar(
      {super.key,
      required this.screens,
      required this.setIndex,
      required this.index});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Container(
      width: width,
      height: height * 0.1,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
            top: BorderSide(width: 1, color: Colors.black),
            left: BorderSide(width: 1, color: Colors.black),
            right: BorderSide(width: 1, color: Colors.black),
            bottom: BorderSide(width: 1, color: Colors.black)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.screens
            .map(
              (e) => widget.index == widget.screens.indexOf(e)
                  ? GradientMask(
                      child: BottomBarIcon(
                        icon: widget.screens[widget.screens.indexOf(e)][0],
                        label: widget.screens[widget.screens.indexOf(e)][1],
                        onPressed: () =>
                            widget.setIndex(widget.screens.indexOf(e)),
                      ),
                    )
                  : BottomBarIcon(
                      icon: widget.screens[widget.screens.indexOf(e)][0],
                      label: widget.screens[widget.screens.indexOf(e)][1],
                      onPressed: () =>
                          widget.setIndex(widget.screens.indexOf(e)),
                    ),
            )
            .toList(),
      ),
    );
  }
}

class BottomBarIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const BottomBarIcon(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});

  @override
  State<BottomBarIcon> createState() => _BottomBarIconState();
}

class _BottomBarIconState extends State<BottomBarIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () => widget.onPressed(), icon: Icon(widget.icon)),
        Text(widget.label)
      ],
    );
  }
}
