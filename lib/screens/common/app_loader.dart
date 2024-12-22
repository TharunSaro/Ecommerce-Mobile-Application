import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final double? size;
  final Color? color;

  const AppLoader({
    super.key,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 50.0,
        height: size ?? 50.0,
        child: CircularProgressIndicator(
          strokeWidth: 6.0,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
