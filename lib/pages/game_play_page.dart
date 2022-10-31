import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_paper_scissor/logic/game_play_bloc.dart';

class GamePlayPage extends StatelessWidget {
  const GamePlayPage({Key? key}) : super(key: key);

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
                        const SizedBox(height: 16),
                        const Text(
                          'Choose a Move',
                          style: TextStyle(
                              color: Color(0xff0D363F),
                              fontSize: 24,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () => context
                                  .read<GamePlayBloc>()
                                  .chooseMove(context, TypeMove.rock),
                              child: Container(
                                width: 103,
                                height: 92,
                                decoration: state.typeMove == TypeMove.rock
                                    ? BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 4),
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ])
                                    : null,
                                child: Image.asset('assets/rock 1.png',
                                    width: 103, height: 92, fit: BoxFit.cover),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context
                                  .read<GamePlayBloc>()
                                  .chooseMove(context, TypeMove.scissors),
                              child: Container(
                                width: 103,
                                height: 92,
                                decoration: state.typeMove == TypeMove.scissors
                                    ? BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 4),
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ])
                                    : null,
                                child: Image.asset('assets/scissors 1.png',
                                    width: 103, height: 92, fit: BoxFit.cover),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context
                                  .read<GamePlayBloc>()
                                  .chooseMove(context, TypeMove.paper),
                              child: Container(
                                width: 103,
                                height: 92,
                                decoration: state.typeMove == TypeMove.paper
                                    ? BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 4),
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ])
                                    : null,
                                child: Image.asset('assets/paper 1.png',
                                    width: 103, height: 92, fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 72),
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
                              'RULES',
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
