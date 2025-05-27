import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/dependency_injection/identifiers.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await getIt.init();
