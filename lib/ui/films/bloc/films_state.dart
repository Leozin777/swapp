import 'package:swapp/domain/dto/film_dto.dart';
import 'package:swapp/domain/dto/list_dto.dart';

abstract class FilmsState {}

class FilmsInitial extends FilmsState {}

class FilmsLoading extends FilmsState {}

class FilmsLoaded extends FilmsState {
  final ListDto<FilmDto> films;

  FilmsLoaded({required this.films});
}

class FilmsError extends FilmsState {
  final String message;

  FilmsError({this.message = 'An error occurred'});
}
