import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Application"),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: const Color.fromRGBO(96, 125, 139, 1),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Personal info",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20, top: 10),
                child: const TextField(
                  decoration: InputDecoration(labelText: "First name"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: "Last Name",
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20, right: 10),
                      child: const TextField(
                        decoration: InputDecoration(
                            labelText: "Birthday", helperText: "MM/DD/YYY"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20, left: 10),
                      child: const TextField(
                        decoration: InputDecoration(
                            labelText: "Social Security",
                            helperText: "###-##-####"),
                      ),
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Residence address",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20, top: 10),
                child: const TextField(
                  decoration: InputDecoration(labelText: "Address"),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20, right: 10),
                      child: const TextField(
                        decoration: InputDecoration(hintText: "City"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20, left: 10),
                      child: DropdownButtonFormField(
                        items: const [DropdownMenuItem(child: Text("State"))],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Flexible(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(hintText: "ZIP Code"),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    flex: 1,
                    child: DropdownButtonFormField(
                      hint: Text("Countrytyy"),
                      items: const [
                        DropdownMenuItem(value: 5, child: Text("Country"))
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}
