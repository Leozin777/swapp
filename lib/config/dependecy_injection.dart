import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:swapp/data/film_service.dart';
import 'package:swapp/domain/interface/i_film_service.dart';

final injection = GetIt.instance;

setupInjection() {
  injection.registerSingleton<Dio>(Dio());
  injection.registerSingleton<IFilmService>(FilmService());
}
