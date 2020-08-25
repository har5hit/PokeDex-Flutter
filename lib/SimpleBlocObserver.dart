import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/utils/dev_tools/ILogger.dart';

class SimpleBlocObserver extends BlocObserver {
  ILogger logger;

  SimpleBlocObserver(this.logger);

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    logger.log(event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    super.onChange(cubit, change);
    logger.log(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.log(transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    super.onError(cubit, error, stackTrace);
    logger.log(error);
  }
}
