import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/exception/exceptions_notification.dart';
import '../../../core/presentation/widgets/background_widget.dart';
import 'bloc/auth_bloc.dart';
import 'widgets/sign_in.dart';
import 'widgets/sign_up.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BackgroundWidget(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthError) {
                    state.exception.display(context);
                  } else if (state is AuthPushRoute) {
                    context.replace(state.route.goRouterPath);
                  }
                },
                builder: (context, state) {
                  final child = state.authMethod == AuthMethod.signUp
                      ? SignUpWidget(key: const ValueKey('signUp'))
                      : SignInWidget(key: const ValueKey('signIn'));

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Center(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          switchInCurve: Curves.easeIn,
                          switchOutCurve: Curves.easeOut,
                          transitionBuilder: (child, animation) {
                            final rotateAnim = Tween<double>(
                              begin: pi,
                              end: 0,
                            ).animate(animation);
                            return AnimatedBuilder(
                              animation: rotateAnim,
                              builder: (context, child) {
                                return Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()..rotateY(rotateAnim.value),
                                  child: child,
                                );
                              },
                              child: FadeTransition(
                                opacity: Animation<double>.fromValueListenable(
                                  animation,
                                  transformer: (value) {
                                    return (value.round()).toDouble();
                                  },
                                ),
                                child: child,
                              ),
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
      ),
    );
  }
}
