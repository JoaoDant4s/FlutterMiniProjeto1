import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _imc = 0;
  String _image = '';
  String _diagnostic = '';
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'assets/masterball.png',
      'assets/sprout.png',
      'assets/hipno.png',
      'assets/electabuzz.png',
      'assets/slowpoke.png',
      'assets/snorlax.png',
      'assets/wailmer.png'
    ];

    void calcularIMC(int weight, int height) {
      double heightInMeters = height / 100.0;
      double bmi = weight / (heightInMeters * heightInMeters);
      setState(() {
        _imc = bmi;
        if (_imc < 18.5) {
          _image = imagePaths[1];
          _diagnostic = 'Abaixo do peso';
        } else if (_imc >= 18.5 && _imc < 25) {
          _image = imagePaths[2];
          _diagnostic = 'Peso normal';
        } else if (_imc >= 25 && _imc < 30) {
          _image = imagePaths[3];
          _diagnostic = 'Sobrepeso';
        } else if (_imc >= 30 && _imc < 35) {
          _image = imagePaths[4];
          _diagnostic = 'Obesidade I';
        } else if (_imc >= 35 && _imc < 40) {
          _image = imagePaths[5];
          _diagnostic = 'Obesidade II';
        } else if (_imc > 40) {
          _image = imagePaths[6];
          _diagnostic = 'Obesidade Mórbida';
        }
        _weightController.text = '';
        _heightController.text = '';
      });
    }

    submitForm() {
      final weight = int.tryParse(_weightController.text);
      final height = int.tryParse(_heightController.text);

      if (weight == null || height == null) return;
      calcularIMC(weight, height);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(85, 37, 130, 1),
        title: const Text(
          "Calcular IMC",
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: TextField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: "Informe seu peso",
                              helperText: "kg"))),
                  const SizedBox(width: 20),
                  Flexible(
                      flex: 1,
                      child: TextField(
                          controller: _heightController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: "Informe sua altura",
                              helperText: "cm")))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitForm,
                  child: const Text('Calcular IMC'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40, top: 40),
                child: Image.asset(
                  _image.isEmpty ? imagePaths[0] : _image,
                  width: 200,
                  height: 200,
                ),
              ),
              Column(
                children: [
                  Text(_imc != 0 ? "IMC: ${_imc.toStringAsFixed(2)}" : ""),
                  Text(_diagnostic)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
