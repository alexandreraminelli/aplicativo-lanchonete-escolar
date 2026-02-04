/// Exceção personalizada para erros do Firebase.
///
/// Mapeia códigos de erro do Firebase para mensagens amigáveis pro usuário.
class AppFirebaseException implements Exception {
  // -- Static Constants ---------------------------------------------------- //
  /// Mapeamento de códigos de erro do Firebase em mensagens pro usuário.
  static const Map<String, String> _messages = {
    // Erros de autenticação comuns
    'invalid-email': 'O e-mail informado é inválido.',
    'user-disabled':
        'Sua conta foi desativada. Entre em contato com o suporte.',
    'user-not-found': 'Não encontramos uma conta com esse e-mail.',
    'wrong-password': 'Senha incorreta. Tente novamente.',
    'email-already-exists': 'Este e-mail já está cadastrado.',
    'operation-not-allowed': 'Este método de login está desativado no momento.',

    // Erros de token
    'id-token-expired': 'Sua sessão expirou. Faça login novamente.',
    'id-token-revoked': 'Sua sessão foi invalidada. Faça login novamente.',
    'invalid-id-token': 'Token de autenticação inválido.',
    'session-cookie-expired': 'Sua sessão expirou. Faça login novamente.',
    'session-cookie-revoked':
        'Sua sessão foi invalidada. Faça login novamente.',

    // Erros de conexão e servidor
    'network-request-failed':
        'Sem conexão com a internet. Verifique sua conexão.',
    'internal-error': 'Erro no servidor. Tente novamente mais tarde.',
    'too-many-requests':
        'Muitas tentativas. Aguarde alguns minutos antes de tentar novamente.',

    // Erros de validação de dados
    'invalid-password': 'A senha deve ter pelo menos 6 caracteres.',
    'invalid-phone-number': 'O número de telefone informado é inválido.',
    'invalid-display-name': 'O nome exibido é inválido.',
    'invalid-photo-url': 'A URL da foto é inválida.',
    'phone-number-already-exists':
        'Este número de telefone já está cadastrado.',

    // Erros de permissão
    'insufficient-permission':
        'Você não tem permissão para realizar essa ação.',
    'unauthorized-continue-uri': 'URL de confirmação não autorizada.',

    // Erros de configuração
    'missing-continue-uri': 'URL de confirmação não fornecida.',
    'missing-ios-bundle-id': 'Configuração do app incompleta.',
    'missing-android-pkg-name': 'Configuração do app incompleta.',
    'invalid-dynamic-link-domain': 'Domínio de link dinâmico não configurado.',
    'project-not-found': 'Projeto não encontrado. Verifique a configuração.',

    // Erros de UID e dados do usuário
    'uid-already-exists': 'Este ID de usuário já existe.',
    'invalid-uid': 'ID de usuário inválido.',
    'missing-uid': 'ID de usuário não fornecido.',

    // Erros de claims personalizadas
    'claims-too-large': 'Os dados personalizados excedem o tamanho permitido.',
    'invalid-claims': 'Os dados personalizados são inválidos.',
    'reserved-claims':
        'Foram utilizadas declarações reservadas nos dados personalizados.',

    // Erros de importação de usuários
    'invalid-user-import': 'Os dados do usuário a importar são inválidos.',
    'maximum-user-count-exceeded': 'Número máximo de usuários excedido.',

    // Erros de hash e segurança
    'invalid-hash-algorithm': 'Algoritmo de hash inválido.',
    'missing-hash-algorithm': 'Algoritmo de hash não fornecido.',
  };

  // -- Instance Variables -------------------------------------------------- //

  final String code;

  // -- Public Constructor -------------------------------------------------- //

  AppFirebaseException(this.code);

  // -- Messages Mapper ----------------------------------------------------- //

  String get message =>
      _messages[code] ??
      'Ocorreu um erro inesperado. Tente novamente mais tarde.';

  @override
  String toString() => code;
}
