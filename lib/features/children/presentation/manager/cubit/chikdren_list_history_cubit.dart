import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chikdren_list_history_state.dart';

class ChikdrenListHistoryCubit extends Cubit<ChikdrenListHistoryState> {
  ChikdrenListHistoryCubit() : super(ChikdrenListHistoryInitial());
}
