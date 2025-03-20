import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapp/config/dependecy_injection.dart';
import 'package:swapp/ui/films/bloc/films_bloc.dart';
import 'package:swapp/ui/films/views/films_screen.dart';

void main() {
  setupInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SWAPP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: BlocProvider<FilmsBloc>(
          create: (_) => FilmsBloc(), child: const FilmsScreen()),
    );
  }
}
