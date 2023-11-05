import 'dart:developer' as logger show log;

extension Log on Object {
  void log() => logger.log(toString());
}
