import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:smart_city/src/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:smart_city/src/core/network/connection_checker.dart';
import 'package:smart_city/src/core/secrets/app_secrets.dart';
import 'package:smart_city/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:smart_city/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:smart_city/src/features/auth/domain/repository/auth_repository.dart';
import 'package:smart_city/src/features/auth/domain/usecases/current_user.dart';
import 'package:smart_city/src/features/auth/domain/usecases/user_login.dart';
import 'package:smart_city/src/features/auth/domain/usecases/user_sign_up.dart';
import 'package:smart_city/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:smart_city/src/features/reporting/data/datasources/report_remote_data_source_impl.dart';
import 'package:smart_city/src/features/reporting/data/repositories/report_repository_impl.dart';
import 'package:smart_city/src/features/reporting/domain/repositories/report_repository.dart';
import 'package:smart_city/src/features/reporting/domain/usecases/create_report.dart';
import 'package:smart_city/src/features/reporting/domain/usecases/get_all_reports.dart';
import 'package:smart_city/src/features/reporting/presentation/bloc/report_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/reporting/data/datasources/report_remote_data_source.dart';

part 'injection_container.main.dart';