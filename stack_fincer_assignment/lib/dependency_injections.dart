import 'package:injector/injector.dart';
import 'data/api/api_service.dart';
import 'data/providers/auth_provider.dart';
import 'data/repositories/auth_repository.dart';

void setupDependencyInjections() async {
  Injector injector = Injector.appInstance;
  injector.registerSingleton<ApiService>(() => ApiService());

  _authProviderDI(injector);
  _authRepositoryDI(injector);
}

void _authProviderDI(Injector injector) {
  injector.registerDependency<AuthProvider>(() {
    var api = injector.get<ApiService>();
    return AuthProvider(api: api);
  });
}

void _authRepositoryDI(Injector injector) {
  injector.registerDependency<AuthRepository>(() {
    var authProvider = injector.get<AuthProvider>();
    return AuthRepository(authProvider: authProvider);
  });
}
