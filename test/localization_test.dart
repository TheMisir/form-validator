import 'package:form_validator/form_validator.dart';
import 'package:form_validator/src/i18n/az.dart';
import 'package:form_validator/src/i18n/de.dart';
import 'package:form_validator/src/i18n/en.dart';
import 'package:form_validator/src/i18n/fr.dart';
import 'package:form_validator/src/i18n/tr.dart';
import 'package:test/test.dart';

final availableLocales = <String, FormValidatorLocale>{
  'az': LocaleAz(),
  'en': LocaleEn(),
  'tr': LocaleTr(),
  'fr': LocaleFr(),
  'de': LocaleDe(),
};

void validateLocale(ValidationBuilder builder, FormValidatorLocale locale) {
  expect(builder.reset().test(null), equals(locale.required()));
  expect(builder.reset().minLength(5).test('abc'),
      equals(locale.minLength('abc', 5)));
  expect(builder.reset().maxLength(1).test('abc'),
      equals(locale.maxLength('abc', 1)));
  expect(builder.reset().email().test('abc'), equals(locale.email('abc')));
  expect(
      builder.reset().phone().test('abc'), equals(locale.phoneNumber('abc')));
  expect(builder.reset().url().test('abc'), equals(locale.url('abc')));
  expect(builder.reset().ip().test('abc'), equals(locale.ip('abc')));
  expect(builder.reset().ipv6().test('abc'), equals(locale.ipv6('abc')));
}

void main() {
  test('locale names', () {
    availableLocales.forEach((key, value) {
      expect(value.name(), equals(key));
    });
  });

  test('global locale by name', () {
    availableLocales.forEach((key, value) {
      ValidationBuilder.setLocale(key);
      validateLocale(ValidationBuilder(), value);
    });
  });

  test('global locale', () {
    availableLocales.values.forEach((value) {
      ValidationBuilder.globalLocale = value;
      validateLocale(ValidationBuilder(), value);
    });
  });

  test('local locale by name', () {
    availableLocales.forEach((key, value) {
      validateLocale(ValidationBuilder(localeName: key), value);
    });
  });

  test('local locale', () {
    availableLocales.values.forEach((value) {
      validateLocale(ValidationBuilder(locale: value), value);
    });
  });

  test('invalid locale', () {
    expect(() => ValidationBuilder(localeName: 'invalid'), throwsArgumentError);
  });
}
