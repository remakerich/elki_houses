import 'package:elki_houses/core/ui.dart';
import 'package:elki_houses/modules/home/controllers/filter_provider.dart';
import 'package:elki_houses/modules/home/models/house.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage(
    this.house, {
    Key? key,
  }) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(filterProvider);

    return Scaffold(
      body: Stack(
        children: [
          const _GoBackWidget(),
        ],
      ),
    );
  }
}

class _GoBackWidget extends StatelessWidget {
  const _GoBackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -9.0),
              color: kShadowColor,
              blurRadius: 16,
            )
          ],
          color: Colors.white,
        ),
        height: 100,
      ),
    );
  }
}
