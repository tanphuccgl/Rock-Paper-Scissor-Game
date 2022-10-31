import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_paper_scissor/logic/game_play_bloc.dart';
import 'package:rock_paper_scissor/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamePlayBloc(),
      child: BlocBuilder<GamePlayBloc, GamePlayState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Rock Paper Scissor Game',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
