import 'package:app4_receitas/ui/recipes/recipes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:app4_receitas/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Auth E2E Test', () {
    testWidgets('deve realizar login', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final emailField = find.byKey(ValueKey('emailField'));
      final passwordField = find.byKey(ValueKey('passwordField'));
      final submitButton = find.byKey(ValueKey('submitButton'));

      await tester.enterText(emailField, 'rrcoelho94@gmail.com');
      await tester.enterText(passwordField, 'Bike2025$');
      await tester.pump();

      await tester.ensureVisible(submitButton);
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      expect(find.byType(RecipesView), findsOneWidget);
    });

    testWidgets('deve realizar cadastro', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final toggleButton = find.byKey(ValueKey('toggleButton'));
      await tester.ensureVisible(toggleButton);
      await tester.tap(toggleButton);

      final emailField = find.byKey(ValueKey('emailField'));
      final passwordField = find.byKey(ValueKey('passwordField'));
      final confirmPasswordField = find.byKey(ValueKey('confirmPasswordField'));
      final usernameField = find.byKey(ValueKey('usernameField'));
      final avatarUrlField = find.byKey(ValueKey('avatarUrlField'));

      final submitButton = find.byKey(ValueKey('submitButton'));

      await tester.enterText(emailField, 'rrcoelho94@gmail.com');
      await tester.enterText(passwordField, 'Bike2025$');
      await tester.enterText(confirmPasswordField, 'Bike2025$');
      await tester.enterText(usernameField, 'renata');
      await tester.enterText(
        avatarUrlField,
        'https://avatars.githubusercontent.com/u/127506139?v=4',
      );
      await tester.pump();

      await tester.ensureVisible(submitButton);
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      expect(
        find.text(
          'E-mail de confirmação enviado. Verifique sua caixa de entrada',
        ),
        findsOneWidget,
      );
    });
  });
}