import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/src/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:smart_city/src/core/theme/theme.dart';
import 'package:smart_city/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:smart_city/src/features/auth/presentation/pages/login_page.dart';
import 'package:smart_city/src/features/reporting/presentation/bloc/report_bloc.dart';
import 'package:smart_city/src/features/reporting/presentation/pages/report_page.dart';
import 'package:smart_city/src/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<ReportBloc>(),
      ),
    ],
    child: const MyApp(),
  ));}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(
      AuthIsUserLoggedIn(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart City Application',
      theme: AppTheme.darkThemeMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return const ReportPage();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
