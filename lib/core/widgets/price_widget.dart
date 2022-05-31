import 'package:elki_houses/core/ui.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
    this.price, {
    Key? key,
  }) : super(key: key);

  final int price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$price ₽',
          style: kPrimaryStyle,
        ),
        const Text(
          '/сут.',
          style: kCaptionStyle,
        ),
      ],
    );
  }
}
