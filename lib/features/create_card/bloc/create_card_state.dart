part of 'create_card_bloc.dart';

@immutable
sealed class CreateCardState extends Equatable {
  const CreateCardState();

  @override
  List<Object?> get props => [];
}

final class CreateCardInitial extends CreateCardState {
  const CreateCardInitial({
    this.isFront = true,
    this.card = const model.FlipCard.init(),
  });

  final bool isFront;
  final model.FlipCard card;

  @override
  List<Object?> get props => [isFront, card];
}
