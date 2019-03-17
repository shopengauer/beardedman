import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/redux/state.dart';
import 'package:mobile/redux/actions.dart';
import 'package:mobile/redux/reducers.dart';
import 'package:mobile/widgets/beardedman_widget.dart';
import 'package:redux/redux.dart';

/// Root widget in
class RootStoreProviderWidget extends StatelessWidget {
  /// Хранилище для перечня состояний приложения
  ///
  final Store<BeardedManState> store =
      Store(beardedManReducers, initialState: BeardedManState.initialState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'BeardedMan App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          body: Column(
            children: <Widget>[
              Container(height: 600, child: BeardedManWidget()),
              //  FloatingActionButton(child: Text('add'),)
            ],
          ),
          floatingActionButton: StoreConnector<BeardedManState, VoidCallback>(
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  child: Text('Add'),
                );
              },
              converter: (store) =>
                  () => store.dispatch(AddTickerAction(ticker: 'bmy'))),
        ),
      ),
    );
  }
}
