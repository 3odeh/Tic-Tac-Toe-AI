import 'package:flutter/material.dart';
import 'package:project4/util/colors.dart';
import 'package:project4/widgets/Image.dart';

class XoWidget extends StatefulWidget {
  final String value;
  final bool isXTurn;
  final Function() onClick;
  const XoWidget({
    Key? key,
    required this.value,
    required this.isXTurn,
    required this.onClick,
  }) : super(key: key);

  @override
  State<XoWidget> createState() => _XoWidgetState();
}

class _XoWidgetState extends State<XoWidget> {
  bool putResult = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (widget.value.isNotEmpty)
          ? null
          : (_) {
              setState(() {
                putResult = true;
              });
            },
      onExit: (widget.value.isNotEmpty)
          ? null
          : (_) {
              setState(() {
                putResult = false;
              });
            },
      child: GestureDetector(
        onTap: (widget.value.isNotEmpty)
            ? null
            : () {
                widget.onClick();
                putResult = false;
              },
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.all(25),
          child: _getChlid(),
        ),
      ),
    );
  }

  Widget? _getChlid() {
    if (widget.value.isNotEmpty) {
      return ImageHandle(
        path: "assets/images/${widget.value}.png",
        color: (widget.value == 'x') ? MyColors.darkColor : MyColors.oColor,
      );
    } else if (putResult) {
      return ImageHandle(
        path: "assets/images/${widget.isXTurn ? 'x' : 'o'}.png",
        color: ((widget.isXTurn) ? MyColors.darkColor : MyColors.oColor)
            .withOpacity(0.5),
      );
    }
    return null;
  }
}
