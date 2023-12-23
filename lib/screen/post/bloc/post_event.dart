import 'package:equatable/equatable.dart';

abstract class PostScreenEvent extends Equatable {}

class InitEvent extends PostScreenEvent {
  InitEvent();
  @override
  List<Object?> get props => [];
}

class OnGetPostListAction extends PostScreenEvent {
  OnGetPostListAction();
  @override
  List<Object?> get props => [];
}

class OnGetPostByIdAction extends PostScreenEvent {
  final int id;
  OnGetPostByIdAction(this.id);
  @override
  List<Object?> get props => [id];
}
