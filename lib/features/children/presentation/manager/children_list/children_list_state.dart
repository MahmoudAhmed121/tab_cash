part of 'children_list_cubit.dart';

@immutable
abstract class ChildrenListState {}

class ChildrenListInitial extends ChildrenListState {}
class ChildrenListLoading extends ChildrenListState {}
class ChildrenListSuccess extends ChildrenListState {
 final List<ChildrenModel> childmodel;

  ChildrenListSuccess({required this.childmodel});

}
class ChildrenListFailure extends ChildrenListState {
   final String errMessages ;
  ChildrenListFailure({required this.errMessages});
}

