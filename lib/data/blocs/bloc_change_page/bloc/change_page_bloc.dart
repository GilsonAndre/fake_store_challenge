import 'package:bloc/bloc.dart';

part 'change_page_event.dart';
part 'change_page_state.dart';

class ChangePageBloc extends Bloc<ChangePageEvent, ChangePageState> {
  ChangePageBloc() : super(ChangePageState()) {
    on<ChangePage>((event, emit) {
      emit(ChangePageState(index: event.index));
    });
  }
}
