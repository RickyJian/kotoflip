import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_card_bloc.dart';
import '../../../core/core.dart' as core;

class CreateCardPage extends StatelessWidget {
  const CreateCardPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const CreateCardPage(),
      fullscreenDialog: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.sizeOf(context).shortestSide;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(core.Constant().newCardPageAppName),
      ),
      body: BlocProvider<CreateCardBloc>(
        create: (context) => CreateCardBloc(),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size.square(shortestSide * 0.85)),
            child: BlocBuilder<CreateCardBloc, CreateCardState>(
              builder: (context, state) {
                final (isFront) = switch (state) {
                  CreateCardInitial(:final isFront) => (isFront),
                };
                return core.FlipCard(
                  frontLabel: '原文',
                  backLabel: '譯文',
                  isFront: isFront,
                  onFlip: () =>
                      context.read<CreateCardBloc>().add(CardFlipped()),
                  onSave: (front, back, labels) => context
                      .read<CreateCardBloc>()
                      .add(CardSaved(front: front, back: back, labels: labels)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
