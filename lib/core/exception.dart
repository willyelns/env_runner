class DeviceException implements Exception {
  DeviceException({this.message});
  final String message;
}

class EnvironmentException implements Exception {
  EnvironmentException({this.message});
  final String message;
}
