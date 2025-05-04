import '../../core/domain/pokeapi/entities/pokemon.dart';
import '../../core/domain/routing/entity/app_route.dart';

sealed class GameRoute extends AppRoute {}

final class GameInitialRoute extends GameRoute {
  @override
  String get routeName => '/game';
}

final class GameResultRoute extends GameRoute {
  @override
  final GameResultArguments? arguments;

  GameResultRoute([this.arguments]);

  @override
  String get routeName => '/game/result';
}

class GameResultArguments {
  final bool answerCorrect;
  final Pokemon pokemon;

  GameResultArguments({required this.answerCorrect, required this.pokemon});
}
