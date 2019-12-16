import 'dart:io';

import 'package:cli/cli.dart' as cli;
import 'package:args/args.dart';
import 'package:cli/core/constants.dart';
import 'package:cli/core/exception.dart';

ArgResults argResults;

Future<void> main(List<String> arguments) async {
  final optionsParser = ArgParser()
    ..addOption(DEV)
    ..addOption(QA)
    ..addOption(PRD);
  final commands = ArgParser()
    ..addCommand(RUN, optionsParser)
    ..addSeparator(' ')
    ..addCommand(BUILD, optionsParser..addFlag(DEVICE, abbr: 'd'));

  argResults = commands.parse(arguments);
  await runCommand(argResults);
}

Future<void> runCommand(ArgResults args) async {
  final commands = args.arguments;
  try {
    final env = commands[1];
    if (commands.contains(RUN)) {
      await _handleRun(args, env);
    } else if (commands.contains(BUILD)) {
      await _handleBuild(args, env);
    }
  } catch (e) {
    _handleError(e);
  }
  exitCode = 0;
}

Future<void> _handleRun(ArgResults args, String env) async {
  final hasDevice = args.command[DEVICE];
  final device = args.arguments.last;
  await cli.run(env, hasDevice: hasDevice, device: device);
}

Future<void> _handleBuild(ArgResults args, String env) async {
  await cli.build(env);
}

void _handleError(dynamic e) {
  if ((e is DeviceException || e is EnvironmentException) &&
      e.message != null) {
    stderr.writeln('Error: ${e.message}');
  } else {
    stderr.writeln('Error: ${e}');
    exitCode = 2;
  }
}
