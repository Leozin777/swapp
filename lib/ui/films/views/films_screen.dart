import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapp/ui/about/screens/about_screen.dart';
import 'package:swapp/ui/films/bloc/films_bloc.dart';
import 'package:swapp/ui/films/bloc/films_event.dart';
import 'package:swapp/ui/films/bloc/films_state.dart';

class FilmsScreen extends StatefulWidget {
  const FilmsScreen({super.key});

  @override
  State<FilmsScreen> createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FilmsBloc>().add(GetFilms());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars Movies'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const AboutScreen())),
              icon: const Icon(Icons.info_outline))
        ],
      ),
      body: BlocBuilder<FilmsBloc, FilmsState>(builder: (context, state) {
        if (state is FilmsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FilmsLoaded) {
          if (state.films.results == null) {
            return const Center(
              child: Text('No films found'),
            );
          }
          return ListView.builder(
            itemCount: state.films.results!.length,
            itemBuilder: (context, index) {
              final film = state.films.results![index];
              return ListTile(
                title: Text("${film.title} - ${film.releaseDate.year}"),
                subtitle: Text("${film.director}, ${film.producer}"),
              );
            },
          );
        } else if (state is FilmsError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
      }),
    );
  }
}
