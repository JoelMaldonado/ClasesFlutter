import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/banda.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Banda> bandas = [
    Banda(id: '1', name: 'Metallica', votes: 5),
    Banda(id: '2', name: 'Queen', votes: 4),
    Banda(id: '3', name: 'Beatles', votes: 3),
    Banda(id: '4', name: 'Bon jovi', votes: 2),
    Banda(id: '5', name: 'Twenty one Pilots', votes: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nombres de Bandas',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: bandas.length,
          itemBuilder: (context, index) => _bandTile(bandas[index])),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: Icon(Icons.add),
        elevation: 1,
      ),
    );
  }

  ListTile _bandTile(Banda banda) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(banda.name.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      title: Text(banda.name),
      trailing: Text(
        '${banda.votes}',
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {},
    );
  }

  addNewBand() {
    final textController = TextEditingController();

    if (Platform.isAndroid) {
      // Android
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Nueva banda en Android'),
              content: TextField(
                decoration: InputDecoration(hintText: "Nombre de la banda"),
                controller: textController,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => addBandToList(textController.text),
                  child: Text("Añadir"),
                )
              ],
            );
          });
    }

    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text("Nueva banda en IOS"),
            content: CupertinoTextField(
                controller: textController
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text("Añadir"),
                onPressed: () => addBandToList(textController.text),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text("Cancelar"),
                onPressed: ()=> Navigator.pop(context),
              )
            ],
          );
        }
    );
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      setState(() {
        final band = Banda(id: '', name: name, votes: 0);
        bandas.add(band);
      });
    }
    Navigator.pop(context);
  }
}
