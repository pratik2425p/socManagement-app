import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import 'theme/app_theme.dart';
import 'services/society_state.dart';
import 'screens/home_screen.dart';
import 'screens/documents/document_vault_screen.dart';
import 'screens/polling/polling_screen.dart';

late final Client client;
late final SocietyState globalSocietyState;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serverUrl = await getServerUrl();

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = FlutterAuthSessionManager();

  client.auth.initialize();

  globalSocietyState = SocietyState(client: client);

  runApp(const SocietyApp());
}

class SocietyApp extends StatelessWidget {
  const SocietyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Society Management SaaS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HomeScreen(state: globalSocietyState),
      routes: {
        '/documents': (ctx) => DocumentVaultScreen(state: globalSocietyState),
        '/polling': (ctx) => PollingScreen(state: globalSocietyState),
      },
    );
  }
}
