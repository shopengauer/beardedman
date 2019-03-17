
import 'package:flutter/foundation.dart';

/// Абстрактный класс с общей логикой для
/// всех action
abstract class AbstractBManAction {
  String toString() {
    return '$runtimeType';
  }
}

/// Одно из действий (Action в терминологии Redux) которое
/// может создаваться в процессе работы в приложении
/// Action несет в себе какой то параметр с изменением
/// которое в дальнейшем попадает в редьюсер который
/// поменяет state в store
class AddTickerAction extends AbstractBManAction {

  /// параметр с полезной нагрузкой для
  /// изменения состояния приложения
  final String ticker;

  AddTickerAction({@required this.ticker});

}