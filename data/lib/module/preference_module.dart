import 'package:data/service/shared_pref_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule{

 @preResolve
 Future<SharedPreferencesService> get prefs => SharedPreferencesService.getInstance();
 
}