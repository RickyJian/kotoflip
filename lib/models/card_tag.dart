import 'package:equatable/equatable.dart';

class CardTag extends Equatable {
  const CardTag({required this.id, required this.text});

  final String id;
  final String text;

  @override
  List<Object?> get props => [id, text];
}
