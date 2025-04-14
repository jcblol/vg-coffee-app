abstract class EnvironmentConfig {
  static const apiDomain = String.fromEnvironment('API_DOMAIN',
      defaultValue: 'coffee.alexflipnote.dev');
}
