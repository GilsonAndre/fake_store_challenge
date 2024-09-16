part of 'switch_bloc.dart';

abstract class SwitchEvent {
  const SwitchEvent();
}

class SwitchThemeEvent extends SwitchEvent {
  final bool switchButton;

  SwitchThemeEvent(this.switchButton);
}
