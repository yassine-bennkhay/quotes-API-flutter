import 'package:flutter/material.dart';

import 'package:flutter_application_2/network/api_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Quotes',
      ),
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
  @override
  void initState() {
    super.initState();
    fetchAllQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF8C32),
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Color(0xff06113C)),
        ),
      ),
      body: FutureBuilder(
        future: fetchAllQuotes(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xffEEEEEE).withOpacity(0.5),
                    child: ListTile(
                      title: Text(
                        snapshot.data[index].author,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(snapshot.data[index].text),
                    ),
                  );
                });
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Color(0xffFF8C32),
            ));
          }
        },
      ),
    );
  }
}
