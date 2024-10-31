import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _nController = TextEditingController();

  double? a, b;

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        a = double.parse(_aController.text);
        b = double.parse(_bController.text);
      });
    }
  }

  bool _isPrime(int n) {
    if (n <= 1) return false;
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void _checkPrime() {
    int? n = int.tryParse(_nController.text);
    if (n == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng nhập một số nguyên hợp lệ')),
      );
      return;
    }

    bool isPrime = _isPrime(n);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(isPrime ? '$n là số nguyên tố' : '$n không phải là số nguyên tố')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator with Prime Check'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _aController,
                decoration: InputDecoration(labelText: 'Nhập số A'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || double.tryParse(value) == null) {
                    return 'Vui lòng nhập một số hợp lệ cho A';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bController,
                decoration: InputDecoration(labelText: 'Nhập số B'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || double.tryParse(value) == null) {
                    return 'Vui lòng nhập một số hợp lệ cho B';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _calculate,
                child: Text('Thực hiện phép tính'),
              ),
              SizedBox(height: 16),
              if (a != null && b != null) ...[
                Text('Kết quả:'),
                Text('A + B = ${a! + b!}'),
                Text('A - B = ${a! - b!}'),
                Text('A * B = ${a! * b!}'),
                Text('A / B = ${b! != 0 ? (a! / b!).toStringAsFixed(2) : 'Không thể chia cho 0'}'),
              ],
              Divider(),
              TextFormField(
                controller: _nController,
                decoration: InputDecoration(labelText: 'Nhập số N để kiểm tra số nguyên tố'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _checkPrime,
                child: Text('Kiểm tra số nguyên tố'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
