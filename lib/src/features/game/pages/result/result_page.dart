import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/domain/pokeapi/entities/pokemon.dart';
import '../../../../core/presentation/widgets/background_widget.dart';
import '../../../../core/presentation/widgets/pokemon_container.dart';
import 'bloc/result_cubit.dart';

class ResultPage extends StatelessWidget {
  final bool isSuccess;
  final Pokemon pokemon;

  const ResultPage({super.key, required this.isSuccess, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResultCubit()..fetchStats(pokemon.name),
      child: BlocConsumer<ResultCubit, ResultState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final theme = Theme.of(context);
          return BackgroundWidget(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(isSuccess ? 'You caught it! 🎉' : 'Oops! It was ${pokemon.name.toUpperCase()} 😅'),
                centerTitle: true,
                leading: SizedBox.shrink(),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PokeballContainer(
                        logo: true,
                        height: 150,
                        child: Center(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            child: Image.network(pokemon.gameImageUrl),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      PokeballContainer(
                        height: 300,
                        child: (state is ResultLoaded)
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        state.pokemonStats.flavorText?.replaceAll("\n", " ") ?? '',
                                        style: theme.textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                      Wrap(
                                        alignment: WrapAlignment.spaceEvenly,
                                        spacing: 5.0,
                                        children: [
                                          Chip(label: Text('Base XP: ${state.pokemonStats.baseExperience}')),
                                          Chip(label: Text('Base Happiness: ${state.pokemonStats.baseHappiness}')),
                                          Chip(label: Text('Height: ${state.pokemonStats.height}')),
                                          Chip(label: Text('Weight: ${state.pokemonStats.weight}')),
                                        ],
                                      ),
                                      Text(
                                        'ABILITIES',
                                        textAlign: TextAlign.center,
                                      ),
                                      Wrap(
                                        spacing: 5.0,
                                        alignment: WrapAlignment.spaceEvenly,
                                        children:
                                            state.pokemonStats.abilities.map((a) => Chip(label: Text(a))).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Center(
                                child: Assets.lottie.splash.lottie(
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0).copyWith(bottom: 30),
                        child: ElevatedButton(onPressed: context.pop, child: Text('Next Round')),
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
