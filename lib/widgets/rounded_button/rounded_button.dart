import 'package:flutter/material.dart';

class RoundedButtonWithoutIcon extends StatelessWidget {
  RoundedButtonWithoutIcon({
    required this.label,
    required this.onPressed,
    this.primary,
    required this.radius,
    this.elevation,
  });

   Widget label;
   VoidCallback onPressed;
   Color? primary;
   double radius;
   double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        primary: primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        )
      ),
        onPressed: onPressed,
        child: label,
    );
  }
}

class RoundedButtonWithIcon extends StatelessWidget {
  RoundedButtonWithIcon({
    required this.label,
    required this.onPressed,
    this.primary,
    required this.radius,
    required this.icon,
    this.borderColor,
    this.elevation,
  });

  Widget label;
  VoidCallback onPressed;
  Color? primary;
  double radius;
  Widget icon;
  Color? borderColor;
  double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
          primary: primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: borderColor!),
          ),
      ),
      icon: icon,
      onPressed: onPressed,
      label: label,
    );
  }
}
