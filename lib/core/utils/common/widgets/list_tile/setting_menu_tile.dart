import '../../../constants/colors.dart';
import 'package:flutter/material.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      this.subtitle,
      this.trailing,
      this.onTap});
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          size: 28,
          color: AppColors.primary,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
        trailing: trailing,
      ),
    );
  }
}
