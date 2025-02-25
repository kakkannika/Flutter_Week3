import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final bool hasIcon;
  final Color color;
  final TextStyle textStyle;
  final ShapeBorder shape;
  final VoidCallback onPressed;

  BlaButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.hasIcon,
    required this.color,
    required this.textStyle,
    required this.shape,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: hasIcon ? Icon(icon, color: textStyle.color) : Container(),
      label: Text(label, style: textStyle),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        
      ),
      onPressed: onPressed,
    );
  }
}