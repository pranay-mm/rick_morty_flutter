import 'package:data/injectable_config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable_config.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configAppInjection(String env) async {
  GetIt.instance.$initGetIt(environment: env);
  await configAppDataInjection(env);
}
