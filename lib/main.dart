import 'package:flutter/material.dart';
import 'package:painelfinanceiro/api.dart';
import 'package:painelfinanceiro/cards.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finance Dashboard"),
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: Colors.blueGrey[200],
      ),
      body: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  //Api api = Api();

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api().getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Text("Carregando dados ... "),
            );

            break;
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text("Erro ao carregar dados "),
              );
            } else {
              return Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 2.0,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(3.0),
                  children: [
                    MakeDashBoardItem(
                        snapshot.data["results"]["currencies"]["USD"]["name"]
                            .toString(),
                        "Compra",
                        snapshot.data["results"]["currencies"]["USD"]["buy"]
                            .toString()),
                    MakeDashBoardItem(
                        snapshot.data["results"]["currencies"]["USD"]["name"]
                            .toString(),
                        "Venda",
                        snapshot.data["results"]["currencies"]["USD"]["sell"]
                            .toString()),
                    MakeDashBoardItem(
                        snapshot.data["results"]["currencies"]["EUR"]["name"]
                            .toString(),
                        "Compra",
                        snapshot.data["results"]["currencies"]["EUR"]["buy"]
                            .toString()),
                    MakeDashBoardItem(
                        snapshot.data["results"]["currencies"]["EUR"]["name"]
                            .toString(),
                        "Venda",
                        snapshot.data["results"]["currencies"]["EUR"]["sell"]
                            .toString()),
                    MakeDashBoardItem(
                        snapshot.data["results"]["currencies"]["BTC"]["name"]
                            .toString(),
                        "Compra",
                        snapshot.data["results"]["currencies"]["BTC"]["buy"]
                            .toString()),
                    MakeDashBoardItem(
                        snapshot.data["results"]["currencies"]["BTC"]["name"]
                            .toString(),
                        "Venda",
                        snapshot.data["results"]["currencies"]["BTC"]["sell"]
                            .toString()),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
