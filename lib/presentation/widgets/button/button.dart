import 'package:flutter/material.dart';
import 'package:looksy/presentation/utils/theme.dart';

class ButtonWhite extends StatelessWidget {
  final String label;
  final GestureTapCallback? onTap;
  final bool isDisabled;

  const ButtonWhite({
    super.key,
    required this.label,
    required this.onTap,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 48,
        decoration: BoxDecoration(
            color: isDisabled ? neutralTheme[300] : Colors.white,
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDisabled ? neutralTheme[500] : neutralTheme),
            ),
          ],
        ),
      ),
    );
  }
}