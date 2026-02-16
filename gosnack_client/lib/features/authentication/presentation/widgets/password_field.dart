import 'package:flutter/material.dart';
import 'package:gosnack_client/core/resources/icons/icons.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_texts.dart';
import 'package:gosnack_client/features/authentication/presentation/validators/auth_validators.dart';
import 'package:hugeicons/hugeicons.dart';

/// Campo de senha com botão de mostrar/ocultar senha.
class PasswordField extends StatefulWidget {
  // -- Instance Variables -------------------------------------------------- //

  /// Rótulo do campo.
  final String label;

  /// Ícone do campo.
  final List<List<dynamic>> icon;

  /// Controlador de texto para o campo de senha.
  final TextEditingController? fieldController;

  /// Callback de validação.

  // -- Public Constructor -------------------------------------------------- //

  const PasswordField({
    required this.fieldController,
    this.label = AuthTexts.password,
    this.icon = KIcons.password,
    super.key,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  // -- States Variables ---------------------------------------------------- //

  /// Se a senha deve ser ocultada ou mostrada.
  bool _hidePassword = true;

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    /// Botão de visibilidade da senha.
    final passwordVisibilityButton = IconButton(
      // Ícone
      icon: HugeIcon(
        icon: _hidePassword ? KIcons.showPassword : KIcons.hidePassword,
      ),
      // Alternar estado ao pressionar
      onPressed: () {
        setState(() {
          _hidePassword = !_hidePassword;
        });
      },
    );

    return TextFormField(
      decoration: InputDecoration(
        // Label e ícone
        labelText: widget.label,
        prefixIcon: HugeIcon(icon: widget.icon),

        // Botão de visibilidade
        suffixIcon: passwordVisibilityButton,
      ),

      // Ocultar senha
      obscureText: _hidePassword,

      // keyboard config:
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,

      // controller:
      controller: widget.fieldController,
      validator: (String? value) => AuthValidators.validatePassword(value),
    );
  }
}
