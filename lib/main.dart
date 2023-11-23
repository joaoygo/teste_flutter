import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int somatorio = 0;
  final TextEditingController inputTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void somatorioDivisiveis(int numero) {
    setState(() {
      somatorio = 0;
      for (int i = 0; i < numero; i++) {
        if (i % 3 == 0 || i % 5 == 0) {
          somatorio += i;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Digite um número"),
                  controller: inputTextController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite um número.';
                    }
                    int? numero = int.tryParse(value);
                    if (numero == null) {
                      return 'Por favor, digite um número válido.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        somatorioDivisiveis(
                            int.parse(inputTextController.text));
                      }
                    },
                    child: const Text('Calcular')),
              ),
              const Text(
                'O somatório dos números divisíveis por 3 ou 5 até o numero digitado é:',
              ),
              Text(
                "$somatorio",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
