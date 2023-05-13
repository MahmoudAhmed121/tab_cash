part of 'children_list_cubit.dart';

@immutable
abstract class ChildrenListState {}

class ChildrenListInitial extends ChildrenListState {}
class ChildrenListLoading extends ChildrenListState {}
class ChildrenListSuccess extends ChildrenListState {
 final List<ChildrenModel> childrenmodel;

  ChildrenListSuccess({required this.childrenmodel});

}
class ChildrenListFailure extends ChildrenListState {
   final String errMessages ;
  ChildrenListFailure({required this.errMessages});
}

