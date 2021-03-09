import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:searchable_dropdown/searchable_dropdown.dart';

class DictationSearch extends StatefulWidget {
  final onTapOfDictation;

  DictationSearch({@required this.onTapOfDictation});

  @override
  _DictationSearchState createState() => _DictationSearchState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _DictationSearchState extends State<DictationSearch> {
  bool searching = false;
  String _currentSelectedValue;
  final String url = "https://jsonplaceholder.typicode.com/users";

  List data = List(); //edited line
// List newselectedvalue =List.from[data];

  Future<String> getjsondata() async {
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString("assets/json/appointment.json");
    final jsonResult = json.decode(jsonData);
// print(jsonResult)
    data = jsonResult;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      width: 320,
      child: SearchableDropdown.single(
        hint: Text('Select Dictation'),
        label: Text(
          ' Dictation',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        items: data.map((item) {
          print('item $item');
          return DropdownMenuItem<String>(
            child: new Text(item['dictationstatus']),
            value: item['dictationstatus'],
          );
        }).toList(),
        value: _currentSelectedValue,
        isExpanded: true,
        searchHint: new Text('Select ', style: new TextStyle(fontSize: 20)),
        onChanged: (value) {
          print('value $value');
          setState(
                () {
              _currentSelectedValue = value;
            },
          );
        },
      ),
    );
  }
}