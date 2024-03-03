import 'package:flutter/material.dart';

import '../logic/calculation_logic.dart';
import '../widgets/app_buttons.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String display = "0";
  String result = "";
  num checker= 0;

  CalculateLogic calculateLogic = CalculateLogic();

  void onButtonPressed(String text) {
    setState(() {
      if (text == "C") {
        display = "0";
        result = ""; // Clear result when 'C' is pressed
      }
      else if (text == "+/-") {
        display = (num.parse(display) * -1).toString();
      }
      else if (text == "%") {
        display = (num.parse(display) / 100).toString();
      }
      else if (text == "+" || text == "-" || text == "×" || text == "/") {
        display += text; // Append operation to display
      }
      else if (text == "=") {
        checker = evaluateExpression(display);
        if (checker is double){
          result = checker.toStringAsFixed(2);
        }
        else {
          result = checker.toString();
        }
      }
      else {
        if (display == "0") {
          display = text;
        }
        else {
          display += text; // Append text to display
        }
      }
    });
  }

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
      formattedResult = formattedResult.replaceAll(RegExp(r'\.?0+$'), '');// Remove trailing zeros
    }

    return num.parse(formattedResult);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constrains){
            double scaleFactor = constrains.maxWidth / 400;

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15 * scaleFactor),
              //margin: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 80 * scaleFactor),

                  Row (
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        display,
                        style: TextStyle(
                          fontSize: 40 * scaleFactor,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20 * scaleFactor,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        result,
                        style: TextStyle(
                          fontSize: 60 * scaleFactor,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30 * scaleFactor),

                  Row(
                    children: [
                      AppButtons(text: 'C', textColor: Colors.blue, backgroundColor: Colors.blue.withOpacity(.1), onTap: () => onButtonPressed("C"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: '+/-', textColor: Colors.blue, backgroundColor: Colors.blue.withOpacity(.1), onTap: () => onButtonPressed("+/-"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: '%', textColor: Colors.blue, backgroundColor: Colors.blue.withOpacity(.1), onTap: () => onButtonPressed("%"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: "/", textColor: Colors.blue, backgroundColor: Colors.blue.withOpacity(.1), onTap: () => onButtonPressed("/"), scaleFactor: scaleFactor),
                    ],
                  ),
                  SizedBox(height: 25 * scaleFactor),

                  Row(
                    children: [
                      AppButtons(text: "7", onTap: () => onButtonPressed("7"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: "8", onTap: () => onButtonPressed("8"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: "9", onTap: () => onButtonPressed("9"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: '×', textColor: Colors.blue, backgroundColor: Colors.blue.withOpacity(.1), onTap: () => onButtonPressed("×"), scaleFactor: scaleFactor),
                    ],
                  ),
                  SizedBox(height: 25 * scaleFactor),
                  Row(
                    children: [
                      AppButtons(text: "4", onTap: () => onButtonPressed("4"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: "5", onTap: () => onButtonPressed("5"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: "6", onTap: () => onButtonPressed("6"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: "-", textColor: Colors.blue, backgroundColor: Colors.blue.withOpacity(.1), onTap: () => onButtonPressed("-"), scaleFactor: scaleFactor),
                    ],
                  ),
                  SizedBox(height: 25 * scaleFactor),
                  Row(
                    children: [
                      AppButtons(text: "1", onTap: () => onButtonPressed("1"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: "2", onTap: () => onButtonPressed("2"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: "3", onTap: () => onButtonPressed("3"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: "+", textColor: Colors.blue, backgroundColor: Colors.blue.withOpacity(.1), onTap: () => onButtonPressed("+"), scaleFactor: scaleFactor),
                    ],
                  ),
                  SizedBox(height: 25 * scaleFactor),

                  Row(
                    children: [
                      AppButtons(text: "0", isBig: true, onTap: () => onButtonPressed("0"), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: ".", onTap: () => onButtonPressed("."), scaleFactor: scaleFactor),
                      SizedBox(width: 15 * scaleFactor),
                      AppButtons(text: "=", backgroundColor: Colors.red.withOpacity(.2), textColor: Colors.red, onTap: () => onButtonPressed("="), scaleFactor: scaleFactor),
                    ],
                  )
                ],
              ),
            );
          },
        )
      ),
    );
  }
}
