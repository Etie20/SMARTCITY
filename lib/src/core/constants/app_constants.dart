import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static final baseUrl = '${dotenv.env['BASE_URL']}'; //* supabase url
  static final apiToken = '${dotenv.env['ANON_KEY']}'; //* supabase anon key
}