// Tab Diamension : 50 x 500
// circular border : 5

import 'package:flutter/material.dart';

// import './ListItem.dart';

class ListBox extends StatefulWidget {
  const ListBox({super.key});

  @override
  State<ListBox> createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  String title = '';
  int count = 0;
  List myList = [];

  Widget ListItem(int Id, String title) {
    return Container(
      height: 50,
      width: 500,
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(),
            child: Text('$Id. '),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 25, 0),
            decoration: BoxDecoration(),
            child: Text('$title'),
          ),
          Container(
            decoration: BoxDecoration(),
            child: InkWell(
              child: Icon(Icons.cancel, color: Colors.red),
              onTap: () {
                remove_task(Id);
              },
            ),
          )
        ],
      ),
    );
  }

  void add_task(var item) {
    this.setState(() {
      count += 1;
      myList.add(item);
      title = '';
    });
  }

  void remove_task(int Id) {
    this.setState(() {
      myList.removeWhere((item) => item['id'] == Id);
    });
  }

  List<Widget> list_mapping() {
    List<Widget> task_list = [];
    for (var i in myList) {
      task_list.add(ListItem(i['id'], i['title']));
    }
    return task_list;
  }

  Widget TopBar() {
    return Container(
      height: 50,
      width: 500,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(5)),
      child: Text(
        'Task List',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget Input_Field() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            width: 300,
            // padding: EdgeInsets.fromLTRB(30, 0, 0, 5),
            child: TextField(
              controller: TextEditingController(
                // text: this.title
              ),
              onChanged: (data) {
                this.title = data;
                print('item added : $title');
              },
              cursorColor: Colors.black,
              textAlign: TextAlign.center,
              cursorHeight: 25,
              scrollPadding: EdgeInsets.all(2),
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Enter Task here',
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                add_task({'id': this.count + 1, 'title': this.title});
                title = '';
              },
            ),
            padding: EdgeInsets.all(10),
            // margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
            decoration: BoxDecoration(),
          ),
        ],
      ),
      height: 50,
      width: 500,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(5)),
    );
  }

  Widget ContextBar() {
    if (count == 0) {
      return Container();
    } else {
      return Container(
        width: 500,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: list_mapping(),
        ),
      );
    }
  }

  Widget BottomBar() {
    return Container(
      height: 50,
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('Reset'),
            onPressed: () {
              this.setState(() {
                count = 0;
                myList = [];
                title = '';
              });
            },
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TopBar(),
          Input_Field(),
          ContextBar(),
          BottomBar(),
          // ListItem(01,'hello')
        ],
      ),
    );
  }
}
