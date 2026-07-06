class CustomerValidator {
  static String? validateName(String? value) {
    final normalizedValue = value?.trim() ?? '';
    if (normalizedValue.isEmpty) {
      return 'O nome é obrigatório';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    final normalizedValue = value?.trim() ?? '';
    if (normalizedValue.isEmpty) {
      return 'O celular é obrigatório';
    }

    final phoneRegex = RegExp(r'^\d{10,11}$');
    if (!phoneRegex.hasMatch(normalizedValue)) {
      return 'Informe um celular válido';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    final normalizedValue = value?.trim() ?? '';
    if (normalizedValue.isEmpty) {
      return null;
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(normalizedValue)) {
      return 'Informe um email válido';
    }

    return null;
  }
}
