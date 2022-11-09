import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'counter_7',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Program Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if(_counter > 0){
      _counter--;
      }
    });
  }

  oddOrEven(){
    if(_counter % 2 == 0){
      return  Text("GENAP", style: GoogleFonts.pridi(textStyle: const TextStyle(fontSize: 50, color: Colors.red)));
    }
    else{
      return  Text("GANJIL", style: GoogleFonts.pridi(textStyle: const TextStyle(fontSize: 50, color: Colors.blue)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            oddOrEven(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding : const EdgeInsets.only(right: 5.0, left: 35.0, bottom: 15.0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            if(_counter > 0)
            FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
            ),

            FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
            ), 
          ],
        ), 
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
