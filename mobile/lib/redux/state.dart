/// Will be stored here
///  all states of this application
class BeardedManState {

  /// one of the possible states -
  /// list of security tickers
  final List<String> tickers;

  BeardedManState(this.tickers);

  /// Initial states of current application
  factory BeardedManState.initialState() => BeardedManState(List.unmodifiable(['adm','vlo']));

}