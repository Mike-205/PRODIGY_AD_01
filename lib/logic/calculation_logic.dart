class CalculateLogic {
  num evaluateExpression(String expression) {
    List<String> numbers = expression.split(RegExp(r'[+\-×/]'));
    List<String> operators = expression.split(RegExp(r'[^+\-×/]')).where((s) => s.isNotEmpty).toList();

    for (int i = 0; i < operators.length; i++) {
      if (operators[i] == "×" || operators[i] == "/") {
        num result = operators[i] == "×" ? num.parse(numbers[i]) * num.parse(numbers[i + 1]) : num.parse(numbers[i]) / num.parse(numbers[i + 1]);
        numbers[i] = result.toString();
        numbers.removeAt(i + 1);
        operators.removeAt(i);
        i--;
      }
    }

    for (int i = 0; i < operators.length; i++) {
      num result = operators[i] == "+" ? num.parse(numbers[i]) + num.parse(numbers[i + 1]) : num.parse(numbers[i]) - num.parse(numbers[i + 1]);
      numbers[i] = result.toString();
      numbers.removeAt(i + 1);
      operators.removeAt(i);
      i--;
    }

    num finalResult = num.parse(numbers[0]);
    String formattedResult = finalResult.toString();

    // Check if the final result is a decimal number
    if (finalResult % 1 != 0) {
      formattedResult = finalResult.toStringAsFixed(2); // Format the result with 3 decimal places
      formattedResult = formattedResult.replaceAll(RegExp(r'\.?0+$'), ''); // Remove trailing zeros
    }
    return num.parse(formattedResult);
  }
}