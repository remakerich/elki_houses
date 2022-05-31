import 'package:elki_houses/modules/home/models/house_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'house.freezed.dart';
part 'house.g.dart';

@freezed
class House with _$House {
  const House._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory House({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String location,
    @Default('') String description,
    @HouseTypeConverter() required HouseType type,
    @Default(0) int rating,
    @Default(0) int reviewCount,
    @Default([]) List<String> images,
    @Default(0) int price,
  }) = _House;

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);
}
