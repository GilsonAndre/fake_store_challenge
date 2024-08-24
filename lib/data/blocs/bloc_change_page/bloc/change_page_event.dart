part of 'change_page_bloc.dart';

abstract class ChangePageEvent {
  const ChangePageEvent();
}

class ChangePage extends ChangePageEvent {
  final int index;

  const ChangePage(this.index);
}
