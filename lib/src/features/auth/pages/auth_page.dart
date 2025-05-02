import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokegame/src/core/presentation/exception/exceptions_notification.dart';
import 'package:pokegame/src/features/auth/pages/widgets/sign_in.dart';
import 'package:pokegame/src/features/auth/pages/widgets/sign_up.dart';

import 'bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  state.exception.display(context);
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      // return SvgPicture.network(
                      //   'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/${index + 1}.svg',
                      //   colorFilter:
                      //       ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      // );
                      return Image.network(
                          'http://www.serebii.net/pokemongo/pokemon/${(index + 1001).toString().padLeft(3, '0')}.png',
                          color: Colors.black);
                    },
                  ),
                );

                final Widget child = state.authMethod == AuthMethod.signUp
                    ? SignUpWidget(key: const ValueKey('signUp'))
                    : SignInWidget(key: const ValueKey('signIn'));

                return LayoutBuilder(
                  builder: (context, constraints) {
                    return Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        switchInCurve: Curves.easeIn,
                        switchOutCurve: Curves.easeOut,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          final rotateAnim = Tween<double>(
                            begin: pi,
                            end: 0,
                          ).animate(animation);
                          return AnimatedBuilder(
                            animation: rotateAnim,

                            builder: (context, child) {
                              return Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..rotateY(rotateAnim.value),
                                child: child,
                              );
                            },
                            child: FadeTransition(
                              opacity: Animation<double>.fromValueListenable(
                                animation,
                                transformer: (double value) {
                                  return (value.round()).toDouble();
                                },
                              ),
                              child: child,
                            ), //child,
                          );
                        },
                        child: child,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
