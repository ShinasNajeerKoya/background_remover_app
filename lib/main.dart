import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/di/dependency_injection.dart';
import 'core/routes/route_config.dart';
import 'data/services/background_removal_service/background_removal_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://mttdjlexusmntcjlwvwz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im10dGRqbGV4dXNtbnRjamx3dnd6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM4MDMxOTMsImV4cCI6MjA2OTM3OTE5M30.VG9GrazeiUfQPH0Z3efpsl4573lKtDQD-vim_fmZFj4',
  );

  // Initialize background removal service
  await BackgroundRemovalService.initialize();

  // Initialize Hydrated Storage
  final appDocDir = await getApplicationDocumentsDirectory();
  final storage = await HydratedStorage.build(storageDirectory: HydratedStorageDirectory(appDocDir.path));
  HydratedBloc.storage = storage;

  // Initialize dependency injection
  GetItHelper.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = getIt<AppRouter>();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _disposeResources();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Optional: Handle app lifecycle changes
    switch (state) {
      case AppLifecycleState.detached:
        _disposeResources();
        break;
      case AppLifecycleState.paused:
        // App is in background
        break;
      case AppLifecycleState.resumed:
        // App is in foreground
        break;
      case AppLifecycleState.inactive:
        // App is inactive
        break;
      case AppLifecycleState.hidden:
        // App is hidden
        break;
    }
  }

  void _disposeResources() {
    try {
      // Dispose background removal service if it has disposal method
      BackgroundRemovalService.dispose(); // Add this method to your service if needed

      // Close Hydrated Storage
      HydratedBloc.storage.close();

      // Reset GetIt (dispose all singletons)
      getIt.reset();

      // Dispose router
      _appRouter.dispose();
    } catch (e) {
      debugPrint('Error disposing resources: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Background Remove',
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(fontSizeFactor: 1.sp),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        );
      },
    );
  }
}
