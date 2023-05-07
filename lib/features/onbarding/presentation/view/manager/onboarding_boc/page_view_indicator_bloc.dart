
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tab_cach/features/onbarding/presentation/view/manager/onboarding_boc/page_view_indicator_state.dart';

part 'page_view_indicator_event.dart';

class PageViewIndicatorBloc extends Bloc<PageViewIndicatorEvent, IndicatorState> {
  PageViewIndicatorBloc() : super(IndicatorState()) {
    on<IndicatorEvent>((event, emit) {
       emit(IndicatorState(page: state.page));
    });
  }
}
