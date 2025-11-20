import 'package:get_it/get_it.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.config.dart';
import 'package:injectable/injectable.dart';

final _getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => _getIt.init();

T inject<T extends Object>({
  String? instanceName,
  dynamic firstParam,
  dynamic secondParam,
}) {
  return _getIt.get<T>(
    instanceName: instanceName,
    param1: firstParam,
    param2: secondParam,
  );
}
