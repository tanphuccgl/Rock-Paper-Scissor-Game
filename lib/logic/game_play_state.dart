part of 'game_play_bloc.dart';

enum TypeMove { rock, paper, scissors }

enum TypeResult { win, lose, draw }

extension TypeMoveExt on TypeMove {
  String name() {
    switch (this) {
      case TypeMove.rock:
        return 'rock';
      case TypeMove.paper:
        return 'paper';
      case TypeMove.scissors:
        return 'scissors';
      default:
        return "N/A";
    }
  }
}

extension TypeResultExt on TypeResult {
  String name() {
    switch (this) {
      case TypeResult.win:
        return 'win';
      case TypeResult.lose:
        return 'lose';
      case TypeResult.draw:
        return 'draw';
      default:
        return "N/A";
    }
  }
}

class GamePlayState extends Equatable {
  final TypeMove? typeMove;
  final TypeResult typeResult;
  final TypeMove? typeMoveComp;
  final int scoreUser;
  final int scoreComp;

  const GamePlayState({
    this.typeMove,
    this.typeResult = TypeResult.win,
    this.typeMoveComp,
    this.scoreUser = 0,
    this.scoreComp = 0,
  });

  @override
  List<Object?> get props => [
        typeMove,
        typeResult,
        typeMoveComp,
        scoreUser,
        scoreComp,
      ];

  GamePlayState copyWith({
    TypeMove? typeMove,
    TypeResult? typeResult,
    TypeMove? typeMoveComp,
    int? scoreUser,
    int? scoreComp,
  }) {
    return GamePlayState(
      typeMove: typeMove ?? this.typeMove,
      typeResult: typeResult ?? this.typeResult,
      typeMoveComp: typeMoveComp ?? this.typeMoveComp,
      scoreUser: scoreUser ?? this.scoreUser,
      scoreComp: scoreComp ?? this.scoreComp,
    );
  }
}
