import 'package:elki_houses/modules/home/models/house_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterProvider = StateProvider.autoDispose<HouseType>(
  (ref) {
    return const HouseType.all();
  },
);
