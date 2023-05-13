part of 'children_cubit.dart';

@immutable
abstract class ChildrenState {}

class ChildrenInitial extends ChildrenState {}
class ChildrenLoading extends ChildrenState {}
class ChildrenSuccess extends ChildrenState {}
class ChildrenFailure extends ChildrenState {

  final String errorMessage;

  ChildrenFailure(this.errorMessage);

}
