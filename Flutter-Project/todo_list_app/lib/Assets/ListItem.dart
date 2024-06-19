import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  late int Id;
  late String title;
  ListItem({super.key, required int this.Id, required String this.title}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            decoration: const BoxDecoration(),
            child: Text('$Id. '),
          ),
          Container(
            margin:  const EdgeInsets.fromLTRB(15, 0, 25, 0),
            decoration: const BoxDecoration(),
            child: Text(title),
          ),
          Container(
            decoration: BoxDecoration(),
            child: const InkWell(
              child: Icon(Icons.cancel, color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
