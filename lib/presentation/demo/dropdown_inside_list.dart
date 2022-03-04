import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListViewDemoState();
  }
}

class ListViewDemoState extends State<ListViewDemo> {
  List<String> selectedItemValue = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  itemExtent: 50.0,
                  itemBuilder: (BuildContext context, int index) {
                    for (int i = 0; i < 20; i++) {
                      selectedItemValue.add("NONE");
                    }
                    return DropdownButton(
                      value: selectedItemValue[index].toString(),
                      items: _dropDownItem(),
                      onChanged: (value) {
                        selectedItemValue[index] = value.toString();
                        setState(() {});
                      },
                      hint: Text('Select Gender'),
                    );
                  }),
            )
          ],
        ));
  }
}

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> ddl = ["NONE", "1 YEAR", "2 YEAR"];
  return ddl.map((value) => DropdownMenuItem(
        value: value,
        child: Text(value),
      ))
      .toList();
}