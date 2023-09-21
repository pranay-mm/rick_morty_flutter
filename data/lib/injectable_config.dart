import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable_config.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configAppDataInjection(String env) async =>
    await GetIt.instance.$initGetIt(environment: env);
