import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_flutter/main.dart';

void main() {
  testWidgets('Teste do Widget MyHomePage', (WidgetTester tester) async {
    // Construa nosso widget e acione um frame.
    await tester.pumpWidget(const MyApp());

    // Encontrar o TextFormField
    final inputField = find.byType(TextFormField);

    // Enviar um valor inválido
    await tester.enterText(inputField, '');

    // Pressionar o botão "Calcular"
    await tester.tap(find.text('Calcular'));

    // Reconstruir o widget após a interação
    await tester.pump();

    // Verificar se a mensagem de erro é exibida
    expect(find.text('Por favor, digite um número.'), findsOneWidget);

    // Enviar um valor válido
    await tester.enterText(inputField, '10');

    // Pressionar o botão "Calcular"
    await tester.tap(find.text('Calcular'));

    // Reconstruir o widget após a interação
    await tester.pump();

    // Verificar se o resultado é exibido corretamente
    expect(
        find.text(
            'O somatório dos números divisíveis por 3 ou 5 até o numero digitado é:'),
        findsOneWidget);
    expect(find.text('23'), findsOneWidget);
  });
}
