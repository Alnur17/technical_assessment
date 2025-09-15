import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class CustomListTile extends StatelessWidget {
  final String leadingText;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const CustomListTile({
    super.key,
    required this.leadingText,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor ?? AppColors.silver,
        border: Border.all(color: borderColor ?? AppColors.borderColor),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: EdgeInsets.all(12),
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            color: AppColors.white,
          ),
          child: Text(
            leadingText,
            style: h5,
          ),
        ),
        title: Text(
          title,
          style: titleStyle ?? h5.copyWith(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subtitle,
          style: subtitleStyle ?? h6,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
