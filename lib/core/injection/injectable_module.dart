import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class InjectableModule {

  @LazySingleton()
  @Named('housesDio')
  Dio weatherDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://elki.rent/',
      ),
    );
  }
}
