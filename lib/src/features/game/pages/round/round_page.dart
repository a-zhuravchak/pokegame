import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/presentation/widgets/background_widget.dart';
import '../../../../core/presentation/widgets/pokemon_container.dart';
import 'bloc/round_bloc.dart';

class RoundPage extends StatelessWidget {
  const RoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoundBloc(),
      child: BlocConsumer<RoundBloc, RoundState>(
        listener: (context, state) async {
          if (state is RoundStatePushRoute) {
            final route = state.route;
            await context.push(route.routeName, extra: route.arguments);
            if (context.mounted) {
              context.read<RoundBloc>().add(LoadRound());
            }
          }
        },
        builder: (context, state) {
          final bloc = context.read<RoundBloc>();
          if (state is RoundFinalResultState) {
            return ResultWidget(
              score: state.result,
            );
          } else if (state is! RoundReadyState) {
            return BackgroundWidget(
              child: Center(
                child: Assets.lottie.splash.lottie(height: 40, width: 40),
              ),
            );
          } else {
            return BackgroundWidget(
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: PokeballContainer(
                      logo: true,
                      child: Center(
                        child: Image.network(
                          state.pokemon.gameImageUrl,
                          color: Colors.black,
                          fit: BoxFit.fitHeight,
                          height: 250,
                          width: 250,
                          isAntiAlias: true,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            // if (loadingProgress != null) {
                            //   return Center(
                            //     child: CircularProgressIndicator(
                            //       value: loadingProgress.expectedTotalBytes != null
                            //           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            //           : null,
                            //     ),
                            //   );
                            // }
                            return AnimatedOpacity(
                              opacity: loadingProgress == null ? 1 : 0,
                              duration: Duration(milliseconds: 200),
                              child: child,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  bottomSheet: AnswerBottomSheet(
                    options: state.answerOptions.toList(),
                    onSelect: (name) => bloc.add(UserAnswered(name: name)),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class AnswerBottomSheet extends StatefulWidget {
  final List<String> options;
  final void Function(String) onSelect;

  const AnswerBottomSheet({
    super.key,
    required this.options,
    required this.onSelect,
  });

  @override
  State<AnswerBottomSheet> createState() => _AnswerBottomSheetState();
}

class _AnswerBottomSheetState extends State<AnswerBottomSheet> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _isVisible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        offset: _isVisible ? Offset.zero : const Offset(0, 1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PokeballContainer(
            height: 250,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.options
                  .map(
                    (option) => ElevatedButton(
                      onPressed: () => widget.onSelect(option),
                      child: Text(option.toUpperCase()),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: PokeballContainer(
                logo: true,
                child: Center(
                  child: Text('YOU GOT $score OUT OF 5 ${score == 5 ? '🔥' : '👍'}'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
