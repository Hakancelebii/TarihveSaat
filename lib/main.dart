import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var tfsaat = TextEditingController();
  var tftarih = TextEditingController();

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
            TextField(
              controller: tfsaat,
              decoration: InputDecoration(
                hintText: "Saat Giriniz",
              ),
              onTap: (){
                showTimePicker(context: context,
                    initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                ).then((alinansaat) {
                  setState(() {
                    tfsaat.text= "${alinansaat!.hour} : ${alinansaat.minute}";
                  });
                });
              },
            ),
            TextField(
              controller: tftarih,
              decoration: InputDecoration(
                hintText: "Tarih Giriniz",
              ),
              onTap: (){
                showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2050)).then((alinantarih) {
                  tftarih.text="${alinantarih!.day}/${alinantarih.month}/${alinantarih.year}";
                });
              },
            ),
          ],
        ),
      ),

    );
  }
}
