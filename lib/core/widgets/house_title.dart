import 'package:elki_houses/core/ui.dart';
import 'package:elki_houses/modules/home/models/house.dart';
import 'package:flutter/material.dart';

class HouseTitle extends StatelessWidget {
  const HouseTitle(
    this.house, {
    Key? key,
  }) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(house.name, style: kPrimaryStyle),
        const SizedBox(width: 4),
        Text(
          house.location,
          style: kPrimaryStyle.copyWith(
            color: kTextDisabled,
          ),
        ),
      ],
    );
  }
}
