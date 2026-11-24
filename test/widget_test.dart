import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('MyPortfolio smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title is displayed.
    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.text('Tambah Edukasi'), findsOneWidget);
  });

  testWidgets('Navigate to EducationFormPage smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap on 'Tambah Edukasi' card
    await tester.tap(find.text('Tambah Edukasi'));
    await tester.pumpAndSettle();

    // Verify that EducationFormPage is displayed
    expect(find.text('Add Education Form'), findsOneWidget);
    expect(find.text('Nama Institusi'), findsOneWidget);
  });
}
