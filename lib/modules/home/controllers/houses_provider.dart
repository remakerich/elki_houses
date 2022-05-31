import 'package:elki_houses/core/injection/injection.dart';
import 'package:elki_houses/modules/home/data/houses_service.dart';
import 'package:elki_houses/modules/home/models/house.dart';
import 'package:elki_houses/modules/home/models/house_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final housesProvider =
    StateNotifierProvider.autoDispose<HousesNotifier, AsyncValue<List<House>>>(
  (ref) {
    return HousesNotifier(
      getIt<HousesService>(),
    );
  },
);

class HousesNotifier extends StateNotifier<AsyncValue<List<House>>> {
  HousesNotifier(
    this._housesService,
  ) : super(const AsyncData([])) {
    started();
  }

  final HousesService _housesService;
  late final List<House> cache;

  Future<void> started() async {
    state = const AsyncLoading();

    final result = await _housesService.getHouses();

    result.when(
      left: (failure) => state = AsyncError(failure),
      right: (data) {
        cache = data;
        state = AsyncData(data);
      },
    );
  }

  void filter(HouseType type) async {
    if (type.isAll) {
      state = AsyncData(cache);
      return;
    }

    final filteredData =
        cache.where((element) => element.type == type).toList();

    state = AsyncData(filteredData);
  }
}
