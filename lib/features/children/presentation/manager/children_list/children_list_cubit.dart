
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tab_cach/features/children/data/model/child_model.dart';
import 'package:tab_cach/features/children/data/repo/children_repo_impl.dart';

part 'children_list_state.dart';

class ChildrenListCubit extends Cubit<ChildrenListState> {
  ChildrenListCubit(this.childrenRepoImpl) : super(ChildrenListInitial());

  ChildrenRepoImpl childrenRepoImpl;
static ChildrenListCubit get (context)=> BlocProvider.of(context); 
  Future<void> getData() async {
    final childrenList = await childrenRepoImpl.childrenList();

    childrenList.fold(
      (failure) {
        emit(ChildrenListFailure(errMessages: failure.errMessages));
      },
      (childrenList) {
        emit(ChildrenListSuccess(childrenmodel: childrenList));
      },
    );
  }
}
