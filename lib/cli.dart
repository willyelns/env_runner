import 'dart:io';

import 'package:cli/core/constants.dart';
import 'package:cli/core/exception.dart';

Future<void> run(String env, {bool hasDevice, String device}) async {
  switch (env) {
    case DEV:
      await _run(env, hasDevice, device);
      break;
    case TST:
      await _run(env, hasDevice, device);
      break;
    case QA:
      await _run(env, hasDevice, device);
      break;
    case PRD:
      await _run(env, hasDevice, device);
      break;
    default:
      throw (EnvironmentException(
          message: 'That`s not a recognized Environment'));
  }
}

Future<void> build(String env) async {
  switch (env) {
    case DEV:
      await _build(env);
      break;
    case TST:
      await _build(env);
      break;
    case QA:
      await _build(env);
      break;
    case PRD:
      await _build(env);
      break;
    default:
      throw (EnvironmentException(
          message: 'That`s not a recognized Environment'));
  }
}

Future<void> _build(String env) async {
  await _callProcess(() async {
    return await Process.run('flutter',
        ['build', '--extra-front-end-options=-DENV=${env.toLowerCase()}']);
  });
}

Future<void> _callProcess(Function body) async {
  final results = await body();
  await stdout.addStream(results.stdout);
}

Future<void> _run(String env, bool hasDevice, String device) async {
  final commandEnv = env.toLowerCase();
  if (hasDevice) {
    if (device != null) {
      final commandDevice = device.replaceAll(' ', '');
      await _callProcess(() async => await Process.start('flutter', [
            'run',
            '--extra-front-end-options=-DENV=${commandEnv}',
            '-d${commandDevice}'
          ]));
    } else {
      throw DeviceException(message: 'There is no device in args');
    }
  } else {
    await _callProcess(() async => await Process.run(
        'flutter', ['run', '--extra-front-end-options=-DENV=${commandEnv}']));
  }
}
