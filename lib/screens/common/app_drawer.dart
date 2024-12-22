import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final List<Widget> drawerItems;
  final Widget? header;

  const AppDrawer({
    super.key,
    required this.drawerItems,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          if (header != null) header!,
          ...drawerItems,
        ],
      ),
    );
  }
}
