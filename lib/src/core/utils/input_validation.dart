final RegExp _emailRegex = RegExp(r'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$');

class InputValidation {
  static String? validateEmail(String? value) {
    value ??= '';
    if (value.isEmpty) {
      return 'Digite seu e-mail';
    } else if (!value.contains(_emailRegex)) {
      return 'Formato inválido de email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    value ??= '';
    if (value.length < 6) {
      return 'Digite no mínimo 6 caracteres';
    }
    return null;
  }
}
