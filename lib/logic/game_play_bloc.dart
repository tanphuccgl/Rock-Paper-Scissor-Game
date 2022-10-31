import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_paper_scissor/pages/result_page.dart';

part 'game_play_state.dart';

class GamePlayBloc extends Cubit<GamePlayState> {
  GamePlayBloc() : super(const GamePlayState());

  void chooseMove(BuildContext context, TypeMove value) {
    emit(state.copyWith(typeMove: value));
    if (state.typeMove != null) {
      _playingGame();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ResultPage()));
    }
  }

  void clearScore() {
    if (state.scoreUser != 0 || state.scoreComp != 0) {
      emit(state.copyWith(scoreComp: 0, scoreUser: 0));
    }
  }

  void _playingGame() {
    var list = [TypeMove.rock, TypeMove.paper, TypeMove.scissors];

    final rng = Random();
    var element = list[rng.nextInt(list.length)];
    emit(state.copyWith(typeMoveComp: element));
    if (state.typeMoveComp != null) {
      var result = _rule(state.typeMove!, state.typeMoveComp!);
      handleScore(result);
      emit(state.copyWith(typeResult: result));
    }
  }

  void handleScore(TypeResult value) {
    switch (value) {
      case TypeResult.win:
        emit(state.copyWith(
          scoreUser: state.scoreUser + 1,
        ));
        break;
      case TypeResult.lose:
        emit(state.copyWith(
          scoreComp: state.scoreComp + 1,
        ));
        break;

      case TypeResult.draw:
        break;
    }
  }

  TypeResult _rule(TypeMove user, TypeMove com) {
    if (user == TypeMove.rock) {
      switch (com) {
        case TypeMove.rock:
          return TypeResult.draw;
        case TypeMove.scissors:
          return TypeResult.win;
        case TypeMove.paper:
          return TypeResult.lose;
        default:
          return TypeResult.draw;
      }
    } else if (user == TypeMove.scissors) {
      switch (com) {
        case TypeMove.rock:
          return TypeResult.lose;
        case TypeMove.scissors:
          return TypeResult.draw;
        case TypeMove.paper:
          return TypeResult.win;
        default:
          return TypeResult.draw;
      }
    } else {
      switch (com) {
        case TypeMove.rock:
          return TypeResult.win;
        case TypeMove.scissors:
          return TypeResult.lose;
        case TypeMove.paper:
          return TypeResult.draw;
        default:
          return TypeResult.draw;
      }
    }
  }
}
