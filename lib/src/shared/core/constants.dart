import 'dart:io';

enum Environment {
  dev,
  stage,
  prod,
}

class _Config {
  static Map<String, dynamic> debugConstants = {
    'environment': Environment.dev,
  };

  static Map<String, dynamic> stageConstants = {
    'environment': Environment.stage,
  };

  static Map<String, dynamic> prodConstants = {
    'environment': Environment.prod,
  };
}

class Constants {
  static late Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        _config = _Config.debugConstants;
        break;
      case Environment.stage:
        _config = _Config.stageConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
  }

  static Environment get environment {
    return _config['environment'] ?? Environment.dev;
  }

  static String get homeDir {
    return Platform.environment["HOME"] ?? '';
  }

  static String get shareDir {
    return '$homeDir/.local/share';
  }

  static String get iconsDir {
    return '$shareDir/icons';
  }
}
