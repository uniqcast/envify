import 'dart:io' show File;

import 'package:dotenv/dotenv.dart';

/// Load the environment variables from the supplied [path],
/// using the `dotenv` parser.
///
/// If file doesn't exist, an error will be thrown through the
/// [onError] function.
Future<DotEnv> loadEnvs(
  String path,
  Function(String) onError,
) async {
  final file = File.fromUri(Uri.file(path));

  if (!(await file.exists())) {
    onError("Environment variables file doesn't exist at `$path`.");
  }
  final dotEnv = DotEnv(includePlatformEnvironment: true);
  dotEnv.clear();

  final env = dotEnv..load([path]);
  return env;
}
