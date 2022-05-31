import 'package:elki_houses/core/ui.dart';
import 'package:elki_houses/core/utils/extensions.dart';
import 'package:elki_houses/core/widgets/error_refresh_button.dart';
import 'package:elki_houses/core/widgets/house_title.dart';
import 'package:elki_houses/core/widgets/loading.dart';
import 'package:elki_houses/modules/details/views/details_page.dart';
import 'package:elki_houses/modules/home/controllers/filter_provider.dart';
import 'package:elki_houses/modules/home/controllers/houses_provider.dart';
import 'package:elki_houses/modules/home/models/house.dart';
import 'package:elki_houses/modules/home/models/house_type.dart';
import 'package:elki_houses/core/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(filterProvider);
    final housesState = ref.watch(housesProvider);

    return Scaffold(
      body: housesState.when(
        data: (data) => _HousesList(data),
        error: (err, trace) => ErrorRefreshButton(
          errorMessage: err.toString(),
          onTap: () => ref.read(housesProvider.notifier).started(),
        ),
        loading: () {
          return const Center(
            child: LoadingIndicator(),
          );
        },
      ),
    );
  }
}

class _HousesList extends StatelessWidget {
  const _HousesList(
    this.houses, {
    Key? key,
  }) : super(key: key);

  final List<House> houses;

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;
    final paddingTop = MediaQuery.of(context).padding.top;

    return Stack(
      fit: StackFit.expand,
      children: [
        ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.fromLTRB(
            kOutsideGap,
            paddingTop + 4 * kOutsideGap,
            kOutsideGap,
            paddingBottom + kOutsideGap,
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: kOutsideGap,
          ),
          itemCount: houses.length,
          itemBuilder: (context, index) {
            final house = houses[index];
            return _HouseCard(house);
          },
        ),
        const _Filters(),
      ],
    );
  }
}

class _Filters extends StatelessWidget {
  const _Filters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          kOutsideGap,
          paddingTop + kOutsideGap / 2,
          kOutsideGap,
          kOutsideGap / 2,
        ),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 9.0),
              color: kShadowColor,
              blurRadius: 16,
            )
          ],
          color: Colors.white,
        ),
        child: Row(
          children: List.generate(
            HouseTypeConverter.numberOfTypes + 1,
            (index) {
              if (index == 0) {
                return const _FilterOption(
                  type: HouseType.all(),
                );
              }
              final type = HouseTypeConverter.types[index - 1];
              return _FilterOption(type: type);
            },
          ),
        ),
      ),
    );
  }
}

class _FilterOption extends ConsumerWidget {
  const _FilterOption({
    required this.type,
    Key? key,
  }) : super(key: key);

  final HouseType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider.state).state;
    final isSelected = type == filterState;

    return GestureDetector(
      onTap: () {
        ref.read(filterProvider.state).state = type;
        ref.read(housesProvider.notifier).filter(type);
      },
      child: Container(
        margin: const EdgeInsets.only(left: kOutsideGap / 2),
        padding: const EdgeInsets.symmetric(
          horizontal: kOutsideGap,
          vertical: kOutsideGap / 2,
        ),
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : kInactiveColor,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Text(
          type.when(
            aFrame: () => 'A-frame',
            oFrame: () => 'O-frame',
            all: () => 'все дома',
          ),
          style: TextStyle(
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}

class _HouseCard extends StatelessWidget {
  const _HouseCard(
    this.house, {
    Key? key,
  }) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.width - 2 * kOutsideGap;

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            color: kShadowColor,
            blurRadius: 16,
          )
        ],
        borderRadius: BorderRadius.circular(
          kBorderRadius,
        ),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          kBorderRadius,
        ),
        child: SizedBox(
          height: cardHeight,
          child: Stack(
            children: [
              Positioned.fill(
                child: _HouseImage(house),
              ),
              _HouseInfo(house),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: kPrimaryColor.withOpacity(
                      0.1,
                    ),
                    splashColor: kPrimaryColor.withOpacity(
                      0.3,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailsPage(house);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(kOutsideGap),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              HouseTitle(house),
              const SizedBox(height: kOutsideGap),
              Row(
                children: [
                  _RatingStars(house.rating),
                  const SizedBox(width: 4),
                  Text(
                    reviewCountFormatted(
                      house.reviewCount,
                    ),
                  ),
                  Expanded(
                    child: PriceWidget(
                      house.price,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RatingStars extends StatelessWidget {
  const _RatingStars(
    this.rating, {
    Key? key,
  }) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) {
          return Icon(
            Icons.star,
            size: 18,
            color: index < rating ? kPrimaryColor : kTextDisabled,
          );
        },
      ),
    );
  }
}

class _HouseImage extends StatelessWidget {
  const _HouseImage(
    this.house, {
    Key? key,
  }) : super(key: key);
  final House house;

  @override
  Widget build(BuildContext context) {
    return house.images.isEmpty
        ? const SizedBox()
        : Image.network(
            house.images.first,
            fit: BoxFit.cover,
          );
  }
}
