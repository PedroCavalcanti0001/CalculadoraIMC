class ImcTable {
  static String getImc(double imc) {
    if (imc == 0.0) {
      return "Preencha os campos";
    } else if (imc < 18.5) {
      return "Abaixo do peso";
    } else if (imc >= 18.6 && imc <= 24.9) {
      return "Peso ideal";
    } else if (imc >= 25.0 && imc <= 29.9) {
      return "Levemente acima do peso";
    } else if (imc >= 30.0 && imc <= 34.9) {
      return "Obesidade grau I";
    } else if (imc >= 35.0 && imc <= 39.9) {
      return "Obesidade II";
    } else if (imc >= 40.0) {
      return "Obesidade III";
    }
  }
}
