import 'package:flutter/material.dart';

class ThemeWidgetsTest extends StatelessWidget {
  const ThemeWidgetsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.0,
        children: [
          const SizedBox(height: 32.0),
          Text(
            'Tema (Theme.of) — displayLarge',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            'Teste explícito — fontFamily',
            style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 24),
          ),

          const Divider(),

          ElevatedButton(onPressed: () {}, child: Text("Botão Primário 123")),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Botão Primário 123"),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.home_outlined),
            label: Text("Botão Primário com Ícone"),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.home_outlined),
              label: Text("Botão Primário com Ícone"),
            ),
          ),
          // Apenas ícone
          ElevatedButton(onPressed: () {}, child: Icon(Icons.home_outlined)),

          FilledButton(onPressed: () {}, child: Text("Botão Secundário 123")),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              child: Text("Botão Secundário 123"),
            ),
          ),
          FilledButton.icon(
            onPressed: () {},
            icon: Icon(Icons.home_outlined),
            label: Text("Botão Secundário com Ícone"),
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.home_outlined),
              label: Text("Botão Secundário com Ícone"),
            ),
          ),
          // Apenas ícone
          FilledButton(onPressed: () {}, child: Icon(Icons.home_outlined)),

          OutlinedButton(onPressed: () {}, child: Text("Botão Borda 123")),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text("Botão Borda 123"),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.home_outlined),
            label: Text("Botão Borda com Ícone"),
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.home_outlined),
              label: Text("Botão Borda com Ícone"),
            ),
          ),
          // Apenas ícone
          OutlinedButton(onPressed: () {}, child: Icon(Icons.home_outlined)),

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
    );
  }
}
