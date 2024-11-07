import 'package:flutter/material.dart';
import 'package:looksy/presentation/utils/theme.dart';

class Button extends StatelessWidget {
  final String label;
  final GestureTapCallback? onTap;
  final bool isDisabled;
  final Color? colorText;
  final Color? colorBackground;
  final EdgeInsetsGeometry? padding; // Tambahkan padding
  final double textSize; // Tambahkan textSize
  final Color? borderColor; // Tambahkan borderColor
  final Widget? icon; // Tambahkan icon

  const Button({
    super.key,
    required this.label,
    required this.onTap,
    this.isDisabled = false,
    required this.colorText,
    required this.colorBackground,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.textSize = 16,
    this.borderColor, 
    this.icon, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        padding: padding,
        height: 48,
        decoration: BoxDecoration(
          color: isDisabled ? neutralTheme[300] : colorBackground,
          borderRadius: BorderRadius.circular(100),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.w500,
                  color: isDisabled ? neutralTheme[500] : colorText),
            ),
          ],
        ),
      ),
    );
  }
}
