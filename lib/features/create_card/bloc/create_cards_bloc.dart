import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_cards_event.dart';
part 'create_cards_state.dart';

class CreateCardBloc extends Bloc<CreateCardEvent, CreateCardState> {
  CreateCardBloc() : super(CreateCardInitial()) {
    on<CreateCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
