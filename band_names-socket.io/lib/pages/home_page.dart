import 'dart:io';

import 'package:band_names/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 2),
    Band(id: '2', name: 'ColdPlay', votes: 4),
    Band(id: '3', name: 'Maroon Five', votes: 2),
    Band(id: '4', name: 'One Republic', votes: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bandas",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (
          context,
          index,
        ) =>
            _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: _addNewBand,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        
      },
      background: Container(
        padding: EdgeInsets.only(right: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Delete Band",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      key: Key(band.id),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            band.name.substring(0, 2),
          ),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void _addNewBand() {
    final textController = new TextEditingController();

    if (!Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text("New Band name:"),
            content: TextField(controller: textController),
            actions: [
              MaterialButton(
                  child: Text('Add'),
                  elevation: 5,
                  textColor: Colors.blue,
                  onPressed: () => addBandToList(textController.text))
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text("Add New Band name:"),
            content: CupertinoTextField(controller: textController),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text(
                    "Add",
                  ),
                  onPressed: () => addBandToList(textController.text)),
              CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text(
                    "Dismiss",
                  ),
                  onPressed: () => addBandToList(textController.text)),
            ],
          );
        },
      );
    }
  }

  void addBandToList(String name) {
    if (name.length > 3) {
      //podemos  inserir

      this
          .bands
          .add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
