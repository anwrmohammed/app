
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController _numberController = TextEditingController();
  String _result = '';

  void _multiplyNumber() {
    int number = int.tryParse(_numberController.text) ?? 0;
    List<int> multiples = [];

    for (int i = 1; i <= 10; i++) {
      multiples.add(number * i);
    }

    setState(() {
      _result = multiples.join(', ');
    });
  }

  void _calculateProduct() {
    int number = int.tryParse(_numberController.text) ?? 0;
    int product = 1;

    for (int i = 1; i <= number; i++) {
      product *= i;
    }

    setState(() {
      _result = product.toString();
    });
  }

  void _getNegative() {
    int number = int.tryParse(_numberController.text) ?? 0;
    int negative = -number;

    setState(() {
      _result = negative.toString();
    });
  }

  void _clearResult() {
    setState(() {
      _numberController.text = '';
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _multiplyNumber,
              child: Text('Calculate Multiples'),
            ),
            ElevatedButton(
              onPressed: _calculateProduct,
              child: Text('Calculate Product'),
            ),
            ElevatedButton(
              onPressed: _getNegative,
              child: Text('Get Negative'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Result: $_result',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _clearResult,
              child: Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
