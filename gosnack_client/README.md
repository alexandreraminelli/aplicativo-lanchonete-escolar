# GoSnack Client

<!-- TODO: Introdução -->

<!-- TODO: Como executar o projeto -->

---

## 📁 Project Structure

Este projeto segue uma abordagem **Feature-First + Clean Architecture** para organizar o código de forma modular, escalável e de fácil manutenção.

> Referências: <br>
> https://medium.com/@remy.baudet/feature-first-clean-architecture-for-flutter-246366e71c18 <br>
> https://www.linkedin.com/pulse/feature-first-clean-architecture-flutter-r%C3%A9my-baudet-cgtee/

### Visão Geral

<!-- Gerar árvore mais facilmente: https://devtool.tech/en/tree -->

```bash
gosnack_client/
├── assets/
│   └── ...
├── docs/
│   ├── diagrams/
│   │   └── ...
│   └── screenshots/
│       └── ...
├── lib/
│   ├── core/
│   │   └── ...
│   ├── features/
│   │   └── ...
│   ├── app.dart
│   ├── firebase_options.dart
│   └── main.dart
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
├── .gitignore
├── .metadata
├── README.md
├── analysis_options.yaml
├── flutter_launcher_icons.yaml
├── flutter_native_splash.yaml
├── pubspec.lock
└── pubspec.yaml
```

<!-- Explicação -->

| Path/Arquivo                  | Descrição                                                                                                                                                                 |
| :---------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `assets/`                     | Contém todos os **static assets** (imagens, ícones, fontes, animações e logos) registrados no `pubspec.yaml`                                                              |
| `docs/`                       | Documentação de suporte ao projeto, utilizada para entendimento da arquitetura, fluxos e apresentação.                                                                    |
| `docs/diagrams/`              | Diagramas técnicos (UML, arquitetura, casos de uso, classes, fluxos de navegação).                                                                                        |
| `docs/screenshots/`           | Capturas de tela da aplicação para README, portfólio e documentação visual.                                                                                               |
| `lib/`                        | Código-fonte principal da aplicação Flutter.                                                                                                                              |
| `lib/core/`                   | Camada compartilhada e transversal: configurações globais, tema, roteamento, injeção de dependências, widgets reutilizáveis, etc.                                         |
| `lib/features/`               | Implementação das funcionalidades organizadas por domínio funcional (Feature-First).                                                                                      |
| `lib/app.dart`                | Configuração raiz da aplicação, incluindo tema, rotas, bindings globais e configurações de navegação.                                                                     |
| `lib/firebase_options.dart`   | Arquivo gerado pelo **FlutterFire CLI** contendo as configurações de plataforma necessárias para inicializar o Firebase.                                                  |
| `lib/main.dart`               | Entry point da aplicação. Inicializa dependências e executa o `runApp`.                                                                                                   |
| `android/`                    | Código e configurações nativas específicas para a plataforma Android.                                                                                                     |
| `ios/`                        | Código e configurações nativas específicas para a plataforma iOS.                                                                                                         |
| `.gitignore`                  | Define arquivos e diretórios que não devem ser versionados pelo Git.                                                                                                      |
| `.metadata`                   | Metadados gerados automaticamente pelo Flutter. Não deve ser modificado manualmente.                                                                                      |
| `analysis_options.yaml`       | Configuração de lint rules e análise estática do Dart para padronização e qualidade de código.                                                                            |
| `flutter_launcher_icons.yaml` | Configuração do pacote [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons) que gera automaticamente os ícones do aplicativo para cada plataforma. |
| `flutter_native_splash.yaml`  | Configuração do pacote [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash) que gera automaticamente a splash screen do aplicativo.                  |
| `pubspec.lock`                | Arquivo gerado automaticamente que fixa as versões exatas das dependências instaladas.                                                                                    |
| `pubspec.yaml`                | Arquivo principal do projeto: define dependências, assets, fonts e configurações gerais do Flutter.                                                                       |

<img src="docs/diagrams/architecture/application-modular-architecture-diagram.png" alt="Diagrama de Arquitetura Modular da Aplicação" />

### Pasta `assets/`

```bash
gosnack_client/assets/
├── animations/
├── fonts/
├── images/
│   ├── backgrounds
│   ├── illustrations/
│   └── placeholders/
└── logos/
```

| Path                    | Descrição                                                                             |
| :---------------------- | :------------------------------------------------------------------------------------ |
| `animations/`           | Animações Lottie em `.json`.                                                          |
| `fonts/`                | Fontes customizadas em `.ttf`                                                         |
| `images/`               | Imagens estáticas em `.png`, `.jpg`, etc.                                             |
| `images/backgrounds/`   | Imagens de fundo para telas e seções.                                                 |
| `images/illustrations/` | Ilustrações para onboarding, empty states, etc.                                       |
| `images/placeholders/`  | Imagens genéricas para placeholders e erros.                                          |
| `logos/`                | Logotipos da marca em diferentes variações para o app, launcher icon e splash screen. |

### Pasta `lib/core/`

```bash

```

### Pasta `lib/features/`

```bash

```

<img src="docs/diagrams/architecture/feature-module-architecture-diagram.png" alt="Diagrama de Arquitetura do Módulo de Funcionalidade" />
