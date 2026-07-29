import 'package:equatable/equatable.dart';

class FlipCard extends Equatable {
  const FlipCard({
    required this.front,
    required this.back,
    this.labels = const [],
    this.createTime,
  });

  const FlipCard.init()
    : front = '',
      back = '',
      labels = const [],
      createTime = null;

  final String front;
  final String back;
  final List<String> labels;
  final DateTime? createTime;

  FlipCard copyWith({
    String? front,
    String? back,
    List<String>? labels,
    DateTime? createTime,
  }) {
    return FlipCard(
      front: front ?? this.front,
      back: back ?? this.back,
      labels: labels ?? this.labels,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  List<Object?> get props => [front, back, labels, createTime];
}
