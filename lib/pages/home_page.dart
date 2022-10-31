import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_paper_scissor/logic/game_play_bloc.dart';
import 'package:rock_paper_scissor/pages/game_play_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0CEC9),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: SizedBox.expand(
                  child: Image.asset('assets/rockpaperscissors 1.png',
                      fit: BoxFit.fill)),
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
                          children: const [
                            Text('Rules\n',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text(' Choose a Move:\nRock, Paper, Scissors.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF00A3FF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text(
                                'The Computer will also pick a move\nand then we will compare and find\n the winner!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF00A3FF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: 10),
                            Text(
                                'Rock beats Scissors\nScissors beats Paper\nPaper beats Rock',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF00A3FF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )),
                    const SizedBox(height: 50),
                    ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 15)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF63A2FF))),
                        onPressed: () {
                          context.read<GamePlayBloc>().clearScore();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GamePlayPage()));
                        },
                        child: const Text('NEW GAME',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w400)))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
