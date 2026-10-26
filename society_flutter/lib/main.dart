import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import 'core/config/app_config.dart';
import 'core/utils/navigation_service.dart';
import 'services/data/demo_data_source.dart';
import 'services/data/server_data_source.dart';
import 'services/realtime_service.dart';
import 'theme/app_theme.dart';
import 'services/society_state.dart';
import 'screens/home_screen.dart';
import 'screens/documents/document_vault_screen.dart';
import 'screens/polling/polling_screen.dart';

late final Client client;
late final SocietyState globalSocietyState;
late final RealtimeService realtimeService;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (AppConfig.isDemoMode) {
    client = Client('http://localhost:8080');
    globalSocietyState = SocietyState(dataSource: DemoDataSource());
  } else {
    final serverUrl = await getServerUrl();

    client = Client(serverUrl)
      ..connectivityMonitor = FlutterConnectivityMonitor()
      ..authSessionManager = FlutterAuthSessionManager();

    globalSocietyState = SocietyState(
      dataSource: ServerDataSource(client),
      client: client,
    );
  }

  realtimeService = RealtimeService(
    client: client,
    state: globalSocietyState,
  )..init();

  runApp(const SocietyApp());
}

class SocietyApp extends StatelessWidget {
  const SocietyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      title: 'Society Management SaaS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: HomeScreen(state: globalSocietyState),
      routes: {
        '/documents': (ctx) => DocumentVaultScreen(state: globalSocietyState),
        '/polling': (ctx) => PollingScreen(state: globalSocietyState),
      },
    );
  }
}
