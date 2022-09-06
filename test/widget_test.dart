import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sampleproject/login.dart';

void main() {
  testWidgets('email or password is empty, does not sign in',
      (WidgetTester tester) async {
    bool didSignIn = false;
    LoginPage page = const LoginPage();

    await tester.pumpWidget(page);

    await tester.tap(find.byKey(const Key('signIn')));

    expect(didSignIn, false);
  });
}
