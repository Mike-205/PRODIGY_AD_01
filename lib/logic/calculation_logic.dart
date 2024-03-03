class CalculateLogic {
  num calculate(num value1, num value2, String operation) {
    switch (operation) {
      case '+':
        return value1 + value2;
      case '-':
        return value1 - value2;
      case '×':
        return value1 * value2;
      case '/':
        return value1 / value2;
      default:
        return 0;
    }
  }
}