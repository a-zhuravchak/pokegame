import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/data/firebase/entities/score_entry.dart';
import '../../../../core/presentation/widgets/background_widget.dart';
import '../../../../core/presentation/widgets/pokemon_container.dart';
import 'bloc/start_cubit.dart';

class StartGamePage extends StatelessWidget {
  const StartGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartCubit()..fetchScores(),
      child: BlocConsumer<StartCubit, StartState>(
        listener: (context, state) {
          if (state is StartGoRoute) {
            context.go(state.route.goRouterPath);
          }
        },
        builder: (context, state) {
          return BackgroundWidget(
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: state.isLoading
                      ? Center(
                          child: Assets.lottie.splash.lottie(
                            height: 40,
                            width: 40,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            PokeballContainer(
                              logo: true,
                              height: 160,
                              child: state.scores.isEmpty
                                  ? Center(child: Text('LET\'S MAKE YOUR FIRST SCORE'))
                                  : Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: state.scores.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          final item = state.scores[index];

                                          return ScoreItem(
                                            item: item,
                                          );
                                        },
                                      ),
                                    ),
                            ),
                            SizedBox(height: 30),
                            PokeballContainer(
                              child: state.usersScores.isEmpty
                                  ? Center(child: Text('HEY, YOU ARE A FIRST PLAYER TODAY'))
                                  : Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: state.scores.length,
                                        itemBuilder: (context, index) {
                                          final item = state.scores[index];

                                          return LeaderboardItem(
                                            item: item,
                                          );
                                        },
                                      ),
                                    ),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () => context.read<StartCubit>().startGame(),
                              child: Text('LET\'S GO!'),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScoreItem extends StatelessWidget {
  const ScoreItem({super.key, required this.item});

  final ScoreEntry item;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.secondary,
      fontWeight: FontWeight.bold,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.onSecondary,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.13),
              offset: const Offset(0, 3),
              blurRadius: 14,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${item.createdAt.day}/${item.createdAt.month}",
                style: textStyle,
              ),
              SizedBox(height: 10),
              Text(
                item.score.toString(),
                style: textStyle?.copyWith(color: theme.colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeaderboardItem extends StatelessWidget {
  const LeaderboardItem({super.key, required this.item});

  final ScoreEntry item;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.secondary,
      fontWeight: FontWeight.bold,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.onSecondary,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.13),
              offset: const Offset(0, 3),
              blurRadius: 14,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                item.username,
                style: textStyle,
              ),
              Text(
                item.score.toString(),
                style: textStyle?.copyWith(color: theme.colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
