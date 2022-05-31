import 'package:dio/dio.dart';
import 'package:elki_houses/modules/home/models/house.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'houses_repository.g.dart';

@RestApi()
@lazySingleton
abstract class HousesRepository {
  @factoryMethod
  factory HousesRepository(@Named('housesDio') Dio dio) = _HousesRepository;

  @GET('test/house.json')
  Future<List<House>> getHouses();
}
