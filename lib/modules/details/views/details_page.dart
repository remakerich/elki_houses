import 'package:elki_houses/core/ui.dart';
import 'package:elki_houses/core/widgets/house_title.dart';
import 'package:elki_houses/modules/home/controllers/filter_provider.dart';
import 'package:elki_houses/modules/home/models/house.dart';
import 'package:elki_houses/core/widgets/price_widget.dart';
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
          _HouseInfo(house),
          _GoBackWidget(house),
        ],
      ),
    );
  }
}

class _HouseInfo extends StatelessWidget {
  const _HouseInfo(
    this.house, {
    Key? key,
  }) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    final imageHeight = MediaQuery.of(context).size.height / 3;

    return ListView(
      children: [
        _Header(house),
        if (house.images.isNotEmpty)
          SizedBox(
            height: imageHeight,
            child: PageView.builder(
              itemCount: house.images.length,
              itemBuilder: (context, index) {
                final image = house.images[index];
                return Image.network(
                  image,
                );
              },
            ),
          )
        else
          Container(
            height: imageHeight,
            color: Colors.white,
          ),
        Padding(
          padding: const EdgeInsets.all(kOutsideGap),
          child: Text(
            house.description,
            style: kCaptionStyle,
          ),
        )
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(
    this.house, {
    Key? key,
  }) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.fromLTRB(
        kOutsideGap,
        paddingTop + kOutsideGap,
        kOutsideGap,
        kOutsideGap,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HouseTitle(house),
        ],
      ),
    );
  }
}

class _GoBackWidget extends StatelessWidget {
  const _GoBackWidget(
    this.house, {
    Key? key,
  }) : super(key: key);
  final House house;

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kOutsideGap,
          vertical: kOutsideGap / 2,
        ),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceWidget(
                  house.price,
                ),
                const _GoBackButton(),
              ],
            ),
            SizedBox(
              height: paddingBottom,
            )
          ],
        ),
      ),
    );
  }
}

class _GoBackButton extends StatelessWidget {
  const _GoBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(47),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 230,
            color: kPrimaryColor,
            child: Text(
              'Назад',
              style: kPrimaryStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                highlightColor: Colors.white.withOpacity(0.5),
                splashColor: Colors.white.withOpacity(0.5),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
