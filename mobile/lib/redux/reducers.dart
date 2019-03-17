import 'package:mobile/redux/actions.dart';
import 'package:mobile/redux/state.dart';

//typedef

/// Редьюсеры 

/// Reducer handles adding a ticker to the list
/// tickers (this is a test implementation for studying redux)
List<String> tickerReducer(List<String> state, AbstractBManAction action) {
  if (action is AddTickerAction) {
    return <String>[]
      ..addAll(state)
      ..add(action.ticker);
  }

  return state;
}

BeardedManState beardedManReducers(BeardedManState st, dynamic action) =>
    BeardedManState(tickerReducer(st.tickers, action));
