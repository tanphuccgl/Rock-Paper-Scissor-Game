import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_paper_scissor/logic/game_play_bloc.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamePlayBloc, GamePlayState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFD0CEC9),
          body: SafeArea(
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox.expand(
                    child: Image.asset('assets/rockpaperscissors 1.png',
                        fit: BoxFit.cover),
                  ),
                ),
                Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 40),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: const Color(0xFFC4C4C4)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('It’s a ${state.typeResult.name()}!',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(height: 10),
                                Text(
                                    'You Played: ${state.typeMove!.name()}\nComputer Played: ${state.typeMoveComp!.name()}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Color(0xFF00A3FF),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(height: 10),
                                Text(
                                    'Player’s Score:${state.scoreUser}\nComputer’s Score:${state.scoreComp}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Color(0xFF00A3FF),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                              ],
                            )),
                        const SizedBox(height: 64),
                        ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 15)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF63A2FF))),
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'PLAY AGAIN',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
