import 'package:flutter/material.dart';
import 'package:flutter_calculator/app/presentation/widgets/button/button/button.dart';
import 'package:flutter_calculator/app/presentation/widgets/scrollable/display/display.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculatorPage extends StatefulWidget {
  @override
  _SimpleCalculatorPageState createState() => _SimpleCalculatorPageState();
}

class _SimpleCalculatorPageState extends State<SimpleCalculatorPage> {
  String _equation = '0', _result = '0', _expression = '0', _lastTyped = '';
  List<String> _notDoubled = ['+', '-', 'x', '÷'];

  void _buttonPressed(String data) {
    setState(() {
      if ((_lastTyped == data && _notDoubled.contains(data)) ||
          (_notDoubled.contains(data) && _notDoubled.contains(_lastTyped)))
        return;
      _lastTyped = data;
      switch (data) {
        case 'C':
          _equation = '0';
          _result = '0';
          break;
        case '⌫':
          _equation = _equation.length == 1
              ? '0'
              : _equation.substring(0, _equation.length - 1);
          break;
        case '=':
          _expression = _equation;
          _expression = _expression.replaceAll('x', '*');
          _expression = _expression.replaceAll('÷', '/');

          try {
            final parser = Parser();
            final expression = parser.parse(_expression);
            final contextModel = ContextModel();
            _result =
                '${expression.evaluate(EvaluationType.REAL, contextModel)}';
          } catch (e) {
            _result = 'Invalid Operation';
          }
          break;
        default:
          _equation = _equation == '0' ? data : _equation + data;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Column(
        children: [
          Container(
            child: Display(
              alignment: Alignment.bottomRight,
              height: 3.5,
              topText: _equation,
              mainText: _result,
            ),
          ),
          Spacer(),
          _buildKeyboard(size),
        ],
      ),
    );
  }

  Widget _buildKeyboard(Size size) {
    return Row(
      children: [
        Container(
          width: size.width * .75,
          child: Table(
            children: [
              TableRow(
                children: [
                  Button(
                    'C',
                    color: Colors.blueAccent,
                    onTap: _buttonPressed,
                  ),
                  Button(
                    '⌫',
                    color: Colors.blueAccent,
                    onTap: _buttonPressed,
                  ),
                  Button(
                    '÷',
                    color: Colors.redAccent,
                    onTap: _buttonPressed,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Button(
                    '7',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                  Button(
                    '8',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                  Button(
                    '9',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Button(
                    '4',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                  Button(
                    '5',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                  Button(
                    '6',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Button(
                    '1',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                  Button(
                    '2',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                  Button(
                    '3',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Button(
                    '.',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                  Button(
                    '0',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                  Button(
                    '00',
                    color: Colors.black54,
                    onTap: _buttonPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: size.width * .25,
          child: Table(
            children: [
              TableRow(
                children: [
                  Button(
                    'x',
                    color: Colors.redAccent,
                    onTap: _buttonPressed,
                  )
                ],
              ),
              TableRow(
                children: [
                  Button(
                    '-',
                    color: Colors.redAccent,
                    onTap: _buttonPressed,
                  )
                ],
              ),
              TableRow(
                children: [
                  Button(
                    '+',
                    color: Colors.redAccent,
                    onTap: _buttonPressed,
                  )
                ],
              ),
              TableRow(
                children: [
                  Button(
                    '=',
                    color: Colors.blueAccent,
                    height: 2,
                    onTap: _buttonPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
