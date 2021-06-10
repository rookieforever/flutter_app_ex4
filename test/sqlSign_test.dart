import 'package:flutter/material.dart';
import '../lib/sqlSign.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/lib_exp1andexp2/helpPage.dart';
void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  testWidgets('用户注册页面Widget测试', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(sqlSignPage());

    // Create the Finders.
    final userInfoTextFinder = find.text('请输入注册用户名...');
    final userPswTextFinder = find.text('请输入注册密码...');
    final IconFinder = find.byIcon(Icons.title);
    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(userInfoTextFinder, findsOneWidget);
    expect(userPswTextFinder, findsOneWidget);
    expect(IconFinder, findsOneWidget);
  });
}
