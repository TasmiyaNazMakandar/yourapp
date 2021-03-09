
import 'package:YOURDRS_FlutterAPP/network/models/provider.dart';
import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';

import 'package:flutter/material.dart';

import 'package:searchable_dropdown/searchable_dropdown.dart';

class ProviderDropDowns extends StatefulWidget {
  @override
  _ProviderState createState() => _ProviderState();
}

class _ProviderState extends State<ProviderDropDowns> {

  ProviderList selectedprovider;
  List<ProviderList> data = []; //edited line
  Services apiServices = Services();

  @override
  void initState() {
    super.initState();
  }
// To get the API data
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    Providers provider = await apiServices.getProviders();
    data = provider.providerList;
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      width: 320,
      height: 100,
      child: SearchableDropdown.single(
        hint: Text('Select Provider'),
        label: Text('Provider',style: TextStyle(
            fontSize: 16,fontWeight: FontWeight.bold,
            color: Colors.black
        ),),
        //maping the API data and displaying
        items: data.map((item) {
          return DropdownMenuItem<ProviderList>(
            child: new Text(item.displayname),
            value: item,
          );
        }).toList(),
        isExpanded: true,
        value: selectedprovider,
        searchHint: new Text('Select ', style: new TextStyle(fontSize: 20)),
           //called when a new item is selected
        onChanged: (value){
          setState(() {
            selectedprovider=value;
          });
        },
      ),
    );
  }
}
