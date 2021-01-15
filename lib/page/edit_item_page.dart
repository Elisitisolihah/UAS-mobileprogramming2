import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:beritasttb/model/item.dart';

class EditItemPage extends StatefulWidget {
  final Item item;
  final String id;
  EditItemPage({@required this.item, this.id});

  @override
  _EditItemPageState createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  TextEditingController nameController;
  TextEditingController descController;
  TextEditingController qtyController;
  File image;

  @override
  void initState() {
    nameController = TextEditingController();
    descController = TextEditingController();
    qtyController = TextEditingController();
    nameController.text = '';
    descController.text = '';
    qtyController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.item != null){
      nameController.text = widget.item.name;
    descController.text = widget.item.desc;
    qtyController.text = widget.item.qty.toString();
    }
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 25),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Edit Item',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.arrow_back),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                children: [
                  TextField(
                    controller: nameController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: descController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Desc',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: qtyController,
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Qty',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    height: 45,
                    color: Colors.blue,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    onPressed: () {
                      Item item = Item(
                        id: 'S-0',
                        name: nameController.text,
                        desc: descController.text,
                        qty: int.parse(qtyController.text),
                        status: '',
                        image: '',
                      );
                      if(widget.item != null){

                      FirebaseFirestore.instance
                          .collection('item')
                          .doc(widget.id)
                          .update(item.toJson());
                      Navigator.pop(context);
                      }else{

                      FirebaseFirestore.instance
                          .collection('item')
                          .add(item.toJson());
                      Navigator.pop(context);
                      }
                    },
                  ),
                  Visibility(
                    visible: widget.item != null ? true : false,
                                      child: FlatButton(
                      height: 45,
                      color: Colors.red,
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        FirebaseFirestore.instance
                          .collection('item')
                          .doc(widget.id)
                          .delete();
                      Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
