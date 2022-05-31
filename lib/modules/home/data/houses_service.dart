import 'package:elki_houses/core/exceptions/either.dart';
import 'package:elki_houses/core/exceptions/failure.dart';
import 'package:elki_houses/core/exceptions/handle_exceptions.dart';
import 'package:elki_houses/modules/home/data/houses_repository.dart';
import 'package:elki_houses/modules/home/models/house.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HousesService {
  const HousesService(
    this._housesRepository,
  );

  final HousesRepository _housesRepository;

  Future<Either<Failure, List<House>>> getHouses() {
    return handleExceptions(
      () => _housesRepository.getHouses(),
    );
  }
}
