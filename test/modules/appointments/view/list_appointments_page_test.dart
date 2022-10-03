import 'package:clean_architecture_poc/app/app_widget.dart';
import 'package:clean_architecture_poc/app/modules/appointments/presentation/view/pages/list_appointments_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "List Appointments test",
    (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ListAppointmentsPage), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(Text), findsOneWidget);
    },
  );
}
