import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/redux/state.dart';

/// Корневой виджет с изменяемым состоянием в store
///
/// StoreConnector wrap widget that appear
/// this state
class BeardedManWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// StoreConnector оборачивает процесс создания обновленного
    /// виджета после смены state в store (здесь ListView может быть 
    /// более интересной структурой а не виджетом, скорее
    /// виджет должен создаваться только в builder) 
    return StoreConnector<BeardedManState, ListView>(
      /// конвертер который преобразует параметр
      /// из state приложения в более пригодный параметр для
      /// отображения в виджете(что-то типа промежуточного преобразования)
      converter: (store) => ListView(
            children: store.state.tickers.map((ticker) {
              return Text(ticker);
            }).toList(),
          ),

      /// далее сформированное модельное представление
      /// попадает сюда для формирования полноценого виджета
      builder: (context, listViewTickers) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: listViewTickers,
        );
      },
    );
  }
}
