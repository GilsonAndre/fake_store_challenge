import 'dart:async';

import 'package:bloc/bloc.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial()) {
    on<SwitchThemeEvent>(_switchThemeEvent);
  }

  FutureOr<void> _switchThemeEvent(
    SwitchThemeEvent event,
    Emitter<SwitchState> emit,
  ) {}
}
