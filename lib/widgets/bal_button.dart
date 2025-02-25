import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isPrimary;
  final bool hasIcon;
  final VoidCallback onPressed;

  BlaButton({
    required this.label,
    this.icon,
    required this.isPrimary,
    required this.hasIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? Colors.blue : Colors.grey[600], 
        foregroundColor: Colors.white, 
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), 
        ),
        elevation: 5.0, 
      ),
      child: hasIcon
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: Colors.white, 
                ),
                SizedBox(width: 8), 
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
              ],
            )
          : Text(
              label,
              style: TextStyle(
                color: Colors.white, 
                fontSize: 16,
                fontWeight: FontWeight.bold, 
              ),
            ),
    );
  }
}
