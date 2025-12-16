# GoSnack Admin

<!-- TODO: Índice -->

<!-- TODO: Descrição do projeto -->

<!-- TODO: listar tecnologias utilizadas -->

## 📁 Estruturas de Pastas

```bash
gosnack_admin/
├───public/                 # Arquivos estáticos acessíveis publicamente
│   ├───images/             # Arquivos de imagens (ilustrações, background, etc)
│   │   └───.../
│   └───logos/              # Arquivos SVG da logo do app
│
├───src/                    # Código fonte do projeto
│   ├───app/                # Rotas do App Router do Next.js
│   │   ├───(auth)/         # Rotas de autenticação
│   │   │   └───.../
│   │   ├───(private)/      # Rotas privadas
│   │   │   └───.../
│   │   ├───icon.svg        # Ícone favicon do app
│   │   └───layout.tsx      # Layout root do app
│   │
│   ├───components/         # Componentes do projeto
│   │   ├───common/         # Componentes reutilizáveis em diversas partes do app
│   │   ├───forms/          # Componentes de formulário
│   │   ├───layout/         # Componentes de layout (ex: Header, Sidebar, Footer)
│   │   │   └───.../
│   │   ├───providers/      # Provedores de contexto do React
│   │   └───ui/             # Componentes da biblioteca Shadcn
│   │
│   ├───constants/          # Valores constantes do projeto
│   │   ├───texts/          # Constantes de strings de texto
│   │   │   └───.../
│   │   ├───images.ts       # Constantes de strings de paths de imagens
│   │   └───routes.ts       # Constantes de strings de rotas
│   ├───enums/              # Enumerações reutilizáveis do projeto
│   ├───hooks/              # Hooks personalizados do React
│   ├───lib/                # Biblioteca de funções e configurações gerais
│   │   └───firebase/       # Funções do Firebase
│   ├───services/           # Serviços de comunicação com APIs e back-end
│   ├───styles/             # Arquivos de estilos globais e temas
│   │   └───globals.css     # Configuração do Tailwind CSS e variáveis do Shadcn
│   ├───types/              # Tipagens TypeScript globais
│   └───utils/              # Funções utilitárias
│       ├───formatters/     # Funções de formatação (ex: moeda, data, etc)
│       ├───helpers/        # Funções auxiliares
│       └───validators/     # Funções de validação
│
├───.gitignore              # Arquivos e pastas ignorados pelo Git
├───components.json         # Configuração do Shadcn
├───eslint.config.mjs       # Configuração do ESLint
├───next.config.js          # Configuração do Next.js
├───package.json            # Dependências e scripts do projeto
├───pnpm-lock.yaml          # Arquivo de bloqueio do pnpm
├───pnpm-workspace.yaml     # Configuração do workspace do pnpm
├───postcss.config.js       # Configuração do PostCSS
├───README.md               # Documentação do projeto
└───tsconfig.json           # Configuração do TypeScript
```
