import 'package:swapp/domain/dto/film_dto.dart';
import 'package:swapp/domain/dto/list_dto.dart';

abstract interface class IFilmService {
  Future<ListDto<FilmDto>> getFilms();
}
