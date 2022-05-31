import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_type.freezed.dart';
part 'house_type.g.dart';

@freezed
class HouseType with _$HouseType {
  const HouseType._();

  const factory HouseType.aFrame() = HouseTypeAFrame;
  const factory HouseType.oFrame() = HouseTypeOFrame;
  const factory HouseType.all() = HouseTypeAll;

  bool get isAll => this == const HouseType.all();

  factory HouseType.fromJson(Map<String, dynamic> json) =>
      _$HouseTypeFromJson(json);
}

class HouseTypeConverter implements JsonConverter<HouseType, String?> {
  const HouseTypeConverter();

  static const _states = {
    'a-frame': HouseType.aFrame(),
    'o-frame': HouseType.oFrame(),
  };

  static int get numberOfTypes => _states.entries.length;

  static List<HouseType> get types => _states.values.toList();

  @override
  HouseType fromJson(String? value) =>
      _states[value] ?? const HouseType.aFrame();

  @override
  String? toJson(HouseType value) =>
      _states.entries.firstWhere((e) => e.value == value).key;
}
