import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'children_state.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  ChildrenCubit() : super(ChildrenInitial());
}
