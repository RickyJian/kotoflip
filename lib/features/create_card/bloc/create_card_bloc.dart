import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../models/models.dart' as model;

part 'create_card_event.dart';
part 'create_card_state.dart';

class CreateCardBloc extends Bloc<CreateCardEvent, CreateCardState> {
  CreateCardBloc() : super(const CreateCardInitial()) {
    on<CardFlipped>(_cardFlipped);
    on<CardSaved>(_cardSaved);
  }

  void _cardFlipped(CardFlipped event, Emitter<CreateCardState> emit) {
    if (state case CreateCardInitial(:final isFront, :final card)) {
      emit(CreateCardInitial(isFront: !isFront, card: card));
    }
  }

  void _cardSaved(CardSaved event, Emitter<CreateCardState> emit) {
    if (state case CreateCardInitial(:final card)) {
      final current = card.copyWith(
        front: event.front,
        back: event.back,
        labels: event.labels,
      );
      // TODO: save in sqlite
      emit(const CreateCardInitial());
    }
  }
}
