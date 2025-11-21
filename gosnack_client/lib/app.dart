import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/theme/theme.dart';

/// Widget raiz da aplicação.
/// Define temas, rotas e bindings globais.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tema
      themeMode: ThemeMode.system, // tema padrão: sistema
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      // TODO: Bindings gerais da aplicação

      // TODO: Rotas

      // TODO: Tela de carregamento até decidir qual tela mostrar
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.0,
            children: [
              const SizedBox(height: 32.0),
              Text("Texto padrão 123", style: TextStyle(fontSize: 30.0)),
              const Divider(),

              ElevatedButton(
                onPressed: () {},
                child: Text("Botão Primário 123"),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.home_outlined),
                label: Text("Botão Primário com Ícone"),
              ),

              FilledButton(
                onPressed: () {},
                child: Text("Botão Secundário 123"),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: Icon(Icons.home_outlined),
                label: Text("Botão Secundário com Ícone"),
              ),

              OutlinedButton(onPressed: () {}, child: Text("Botão Borda 123")),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.home_outlined),
                label: Text("Botão Borda com Ícone"),
              ),

              const Divider(),

              // Display Styles
              Text(
                'Display Large 123',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'Display Medium 123',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                'Display Small 123',
                style: Theme.of(context).textTheme.displaySmall,
              ),

              const Divider(height: 32),

              // Headline Styles
              Text(
                'Headline Large 123',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Headline Medium 123',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Headline Small 123',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const Divider(height: 32),

              // Title Styles
              Text(
                'Title Large 123',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Title Medium 123',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Title Small 123',
                style: Theme.of(context).textTheme.titleSmall,
              ),

              const Divider(height: 32),

              // Body Styles
              Text(
                'Body Large - usado para textos longos 123',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Body Medium - padrão para a maioria dos textos 123',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Body Small - textos secundários 123',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const Divider(height: 32),

              // Label Styles
              Text(
                'Label Large - Botões e CTAs 123',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'Label Medium - Filtros e Chips 123',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Label Small - Timestamps e metadados 123',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
