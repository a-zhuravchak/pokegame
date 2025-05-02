import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../gen/assets.gen.dart';
import 'bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..splashInit(),
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (BuildContext context, SplashState state) {
          if (state is SplashGoRoute) {
            context.go(state.route.routeName);
          }
        },
        builder: (BuildContext context, SplashState state) {
          return buildBody(context);
        },
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = theme.colorScheme.surface;
    return ColoredBox(
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Assets.lottie.splash.lottie(),
        ),
      ),
    );
  }
}
