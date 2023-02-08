import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mood_swing/Containers/LoginContainer.dart';
import 'package:mood_swing/Containers/State%20Managers/LoginState.dart';
import 'package:mood_swing/main.dart';

import 'TestUtilities.dart';

void main() {
  group("Auth Container Tests", () {
    testWidgets('Test that all pages are navigable',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(App());
      TestUtilities().disableOverflowErrors();
      for (int i = 0; i < LoginPages.values.length-1; i++)  {
        expect(await find.byKey(Key(i.toString())), findsOneWidget);
        await tester.tap(find.byKey(pageToggle));
        await tester.pumpAndSettle();
      }
    });
  });
}
