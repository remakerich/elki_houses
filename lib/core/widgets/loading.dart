import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    this.size = 52.0,
    this.lineWidth = 2,
  }) : super(key: key);

  final double size;
  final double lineWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRing(
        color: Theme.of(context).iconTheme.color ?? Colors.black,
        lineWidth: lineWidth,
        size: size,
      ),
    );
  }
}
