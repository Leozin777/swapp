import 'package:dio/dio.dart';
import 'package:swapp/config/dependecy_injection.dart';
import 'package:swapp/domain/dto/film_dto.dart';
import 'package:swapp/domain/dto/list_dto.dart';
import 'package:swapp/domain/interface/i_film_service.dart';
import 'package:swapp/utils/constants.dart';

class FilmService implements IFilmService {
  final Dio _dio = injection.get<Dio>();

  @override
  Future<ListDto<FilmDto>> getFilms() async {
    try {
      final response = await _dio.get("$apiUrl/films/");
      return ListDto<FilmDto>.fromJson(
          response.data, (json) => FilmDto.fromJson(json));
    } on Exception catch (e) {
      rethrow;
    }
  }
}
