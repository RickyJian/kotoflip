part of 'create_card_bloc.dart';

@immutable
sealed class CreateCardEvent extends Equatable {
  const CreateCardEvent();

  @override
  List<Object?> get props => [];
}

final class CardFlipped extends CreateCardEvent {
  @override
  List<Object?> get props => [];
}

final class CardSaved extends CreateCardEvent {
  const CardSaved({
    required this.front,
    required this.back,
    this.labels = const [],
  });

  final String front;
  final String back;
  final List<String> labels;

  @override
  List<Object?> get props => [front, back, labels];
}
