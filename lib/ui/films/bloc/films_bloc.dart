import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapp/config/dependecy_injection.dart';
import 'package:swapp/domain/interface/i_film_service.dart';
import 'package:swapp/ui/films/bloc/films_event.dart';
import 'package:swapp/ui/films/bloc/films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  final IFilmService _filmService = injection.get<IFilmService>();

  FilmsBloc() : super(FilmsInitial()) {
    on<GetFilms>((event, emit) async {
      emit(FilmsLoading());
      try {
        final films = await _filmService.getFilms();
        emit(FilmsLoaded(films: films));
      } on Exception catch (e) {
        emit(FilmsError(message: e.toString()));
      }
    });
  }
}
