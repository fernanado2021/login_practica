import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_practica/main.dart';

void main() {
  testWidgets('Login screen loads test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LoginApp());

    // Verify that the login screen title and button are present.
    expect(find.text('Bienvenido'), findsOneWidget);
    expect(find.text('Iniciar Sesión'), findsOneWidget);

    // Verify email and password fields exist
    expect(find.byIcon(Icons.email_outlined), findsOneWidget);
    expect(find.byIcon(Icons.lock_outline), findsOneWidget);
  });
}
