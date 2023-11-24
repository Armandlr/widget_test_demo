import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_demo/components/dialog_section.dart';
import 'package:widget_test_demo/components/hide_section.dart';
import 'package:widget_test_demo/components/input_section.dart';
import 'package:widget_test_demo/components/list_section.dart';
import 'package:widget_test_demo/main.dart';

import 'Helper/mock_material_app.dart';

void main() {
  ///tester.pump(Duration(milliseconds: 100));
  /*
    Pump: Flutter tests are frozen widgets until we move it forward by using Pump().
    Pump might not render all the frames that we need, so tester.pump(Duration(milliseconds: 100))
    can be used to let the tester know he needs to move frames forward for 100 milliseconds.
  */

  ///tester.pumpAndSettle();
  /*
    PumpAndSettle does exactly what pump does, except it  it runs pump until there are no frames left to draw.
  */

  ///@visibleForTesting
  /*
    visibleForTesting allows any widget (private widgets included) to be exposed for testing.
  */

  ///tester.binding.setSurfaceSize(Size(400, 400));
  /*
    tester.binding.setSurfaceSize(Size(400, 400)) lets the tester know on what size to test.
    This can be set to any device size to test for overflow errors as well.
  */

  ///General
  /*
    Number of widgets you want to test: findsNothing, findsOneWidget, findsNWidgets(x)
    Tapping on a widget that does not have a key: find.text('Test').first/.last/.at(index)
    Types of finding: byKey - Recommended way. Add a unique key to the widget to test it.
                      byType - Can only be used if there is One widget by this type.
                      byIcon - Find by the type of icon that is used.
                      text - By the text the widget this has.
  */

  group('Widget on page tests', () {
    testWidgets('Main Page Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('You have pushed the button this many times:'),
          findsOneWidget);
    });
    testWidgets('Hide Section Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MockMaterialApp(body: HideSection()));

      await tester.tap(find.byKey(const Key('hideWidgetButton')));
      await tester.pump();

      expect(find.text('This is the hidden widget'), findsOneWidget);

      await tester.tap(find.byKey(const Key('hideWidgetButton')));
      await tester.pump();

      expect(find.text('This is the hidden widget'), findsNothing);
    });
    testWidgets('Input Section Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MockMaterialApp(body: InputSection()));

      await tester.enterText(find.byType(TextFormField), 'First text entered');
      await tester.tap(find.byKey(const Key('showTextButton')));
      await tester.pump();

      await tester.enterText(find.byType(TextFormField), '');

      expect(find.text('First text entered'), findsOneWidget);
    });
    testWidgets('Dialog Section Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MockMaterialApp(body: DialogSection()));

      await tester.tap(find.byKey(const Key('showDialogButton')));

      await tester.pumpAndSettle();

      expect(find.text('Riga dialog'), findsOneWidget);
      expect(
          find.text('This dialog is showing and the text needs to be tested.'),
          findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));

      await tester.pumpAndSettle();

      expect(find.text('Riga dialog'), findsNothing);
      expect(
          find.text('This dialog is showing and the text needs to be tested.'),
          findsNothing);
      expect(find.byIcon(Icons.close), findsNothing);
    });
    testWidgets('List Section Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MockMaterialApp(body: ListSection()));

      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsNothing);
      expect(find.text('4'), findsNothing);
      expect(find.text('5'), findsNothing);
      expect(find.text('6'), findsNothing);

      await tester.dragUntilVisible(
        find.text('3'),
        find.byKey(const Key('listView')),
        const Offset(0, -100),
      );

      await tester.dragUntilVisible(
        find.text('4'),
        find.byKey(const Key('listView')),
        const Offset(0, -100),
      );

      await tester.dragUntilVisible(
        find.text('5'),
        find.byKey(const Key('listView')),
        const Offset(0, -100),
      );

      await tester.dragUntilVisible(
        find.text('6'),
        find.byKey(const Key('listView')),
        const Offset(0, -100),
      );
    });
  });
}
