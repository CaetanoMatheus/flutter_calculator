import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(FlutterCalculator());

class FlutterCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      home: SimpleCalculatorPage(),
    );
  }
}

class SimpleCalculatorPage extends StatefulWidget {
  @override
  _SimpleCalculatorPageState createState() => _SimpleCalculatorPageState();
}

class _SimpleCalculatorPageState extends State<SimpleCalculatorPage> {
  String _equation = '0', _result = '0', _expression = '0', _lastTyped = '';
  double _equationFontSize = 38, _resultFontSize = 48;
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

  Widget _buildButton(String data, {double height = 1, Color color}) {
    return Container(
      color: color,
      height: MediaQuery.of(context).size.height * .1 * height,
      child: FlatButton(
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        child: Text(
          data,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        onPressed: () => _buttonPressed(data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              _equation,
              style: TextStyle(fontSize: _equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(_result, style: TextStyle(fontSize: _resultFontSize)),
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        _buildButton('C', color: Colors.blueAccent),
                        _buildButton('⌫', color: Colors.blueAccent),
                        _buildButton('÷', color: Colors.redAccent),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildButton('7', color: Colors.black54),
                        _buildButton('8', color: Colors.black54),
                        _buildButton('9', color: Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildButton('4', color: Colors.black54),
                        _buildButton('5', color: Colors.black54),
                        _buildButton('6', color: Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildButton('1', color: Colors.black54),
                        _buildButton('2', color: Colors.black54),
                        _buildButton('3', color: Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildButton('.', color: Colors.black54),
                        _buildButton('0', color: Colors.black54),
                        _buildButton('00', color: Colors.black54),
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
                      children: [_buildButton('x', color: Colors.redAccent)],
                    ),
                    TableRow(
                      children: [_buildButton('-', color: Colors.redAccent)],
                    ),
                    TableRow(
                      children: [_buildButton('+', color: Colors.redAccent)],
                    ),
                    TableRow(
                      children: [
                        _buildButton('=', color: Colors.blueAccent, height: 2),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
