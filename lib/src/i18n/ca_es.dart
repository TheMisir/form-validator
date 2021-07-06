import '../form_validator_locale.dart';

class LocaleCaEs implements FormValidatorLocale {
  const LocaleCaEs();

  @override
  String name() => 'ca-es';

  @override
  String minLength(String v, int n) =>
      'El camp ha de tenir al menys $n caràcters';

  @override
  String maxLength(String v, int n) =>
      'El camp ha de tenir com a màxim $n caràcters';

  @override
  String email(String v) => 'El camp no és una adreça de correu electrònic vàlida';

  @override
  String phoneNumber(String v) => 'El camp no és un número de telèfon vàlid';

  @override
  String required() => 'El camp és obligatori';

  @override
  String ip(String v) => 'El camp no és una adreça IP vàlida';

  @override
  String ipv6(String v) => 'El camp no és una adreça IPv6 vàlida';

  @override
  String url(String v) => 'El camp no és una adreça URL vàlida';
}
