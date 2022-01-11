import 'package:flutter/material.dart';

import 'network/homeresponce.dart';
import 'network/httpservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  final HttpService httpService = HttpService();
  HomeResponce? homeResponce;
  List<Table0> table = [];
  List<Table1> table1 = [];
  List<Table2> table2 = [];

  getList() async {
    homeResponce = await httpService.getStudentList(
        "CommonApi/MasterDataSyncApi?token=7JQUWQ20&pagenum=5&entityid=16");
    table = homeResponce!.result!.table;
    table1 = homeResponce!.result!.table1;
    table2 = homeResponce!.result!.table2;
    setState(() {});
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Customer Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 20),
          child: ListView.builder(
            itemCount: table2.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {},
                child: Card(
                  child: ListTile(
                    title: Text(
                      table2[i].customerName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      table2[i].customerMobileNumber,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.normal),
                    ),
                    leading: Text(
                      "${table2[i].customerId}",
                    ),
                  ),
                  elevation: 8,
                  shadowColor: Colors.green,
                  margin: const EdgeInsets.all(8),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      )),
                ),
              );
            },
          ),
        ));
  }
}
