import 'package:flutter_test/flutter_test.dart';
import 'package:sampleproject/login.dart';
import 'package:sampleproject/validation.dart';

void main() {

  test("TC-01: empty email returns error string ", () {
    var result = Validations.emailValidate("");
    expect(result, "Email can\'t be empty");
  });


  test("TC-02: Verify Email id check\n ", ()  {
    var result = Validations.emailValidate("abc@gmail.com");
    expect(result, null);
  });


  test('TC-03: Verify invalid Email address', () {
    String emailId = 'abc@gmail';
    var result = Validations.emailValidate(emailId);
    expect(result, 'Enter valid email');
  });


  test('TC-04: Empty password returns error string', () {
    var result = Validations.passValidate('');
    expect(result, 'Password can\'t be empty');
  });

  test('TC-05: Password maximum Length 6', () {
    final result = Validations.passValidate('pasd');
    expect(result, "Minimum password length should be 6");
  });
  test('TC-07: non-empty password returns null', () {
    final result = Validations.passValidate('Pas@21sword');
    expect(result, null);
  });
}
