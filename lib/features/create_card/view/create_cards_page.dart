import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_cards_bloc.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(core.Constant().newCardPageAppName),
      ),
      body: BlocProvider(
        create: (context) => CreateCardBloc(),
        child: const Center(child: Text('create card haha')),
      ),
    );
  }
}
