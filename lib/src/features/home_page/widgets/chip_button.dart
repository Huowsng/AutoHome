import 'package:autohome/src/core/theme/palette.dart';
import 'package:flutter/material.dart';

class ChipButton extends StatefulWidget {
  const ChipButton({
    Key? key,
    required this.isSeleted,
    required this.roomName,
    required this.onChipAction,
  }) : super(key: key);

  final bool isSeleted;
  final String roomName;
  final VoidCallback onChipAction;

  @override
  State<ChipButton> createState() => _ChipButtonState();
}

class _ChipButtonState extends State<ChipButton> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Palette.backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(0, 4),
            color: Palette.shadowBlack.withOpacity(0.06),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onChipAction,
          borderRadius: BorderRadius.circular(32),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 100),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: widget.isSeleted ? Palette.textBlack : Palette.textGray,
              ),
              child: Center(
                child: Text(widget.roomName),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
