# widget_test_demo

Basic widget test demo.

## Description

This project is just a basic demo for widget tests to get started.

#### tester.pump(Duration(milliseconds: 100));
```
Pump: Flutter tests are frozen widgets until we move it forward by using Pump().
Pump might not render all the frames that we need, so tester.pump(Duration(milliseconds: 100))
can be used to let the tester know he needs to move frames forward for 100 milliseconds.
```

#### tester.pumpAndSettle();
```
PumpAndSettle does exactly what pump does, except it  it runs pump until there are no frames left to draw.
```

#### @visibleForTesting
```
visibleForTesting allows any widget (private widgets included) to be exposed for testing.
```

#### tester.binding.setSurfaceSize(Size(400, 400));
```
tester.binding.setSurfaceSize(Size(400, 400)) lets the tester know on what size to test.
This can be set to any device size to test for overflow errors as well.
```

#### General
```
Number of widgets you want to test: findsNothing, findsOneWidget, findsNWidgets(x)
Tapping on a widget that does not have a key: find.text('Test').first/.last/.at(index)
Types of finding: byKey - Recommended way. Add a unique key to the widget to test it.
byType - Can only be used if there is One widget by this type.
byIcon - Find by the type of icon that is used.
text - By the text the widget this has.
```
