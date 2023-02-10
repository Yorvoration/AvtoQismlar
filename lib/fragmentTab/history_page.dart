import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _SampesPageState createState() => _SampesPageState();
}

class _SampesPageState extends State<HistoryPage> with SingleTickerProviderStateMixin {

  Future<void> _getSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    print(prefs.getString('codeVerified'));
    print(prefs.getString('fullName'));
    print(prefs.getString('phone'));
    print(prefs.getString('address'));
    print(prefs.getString('client_id'));
    _getOrders();
  }

  Future<void> _getOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('http://avtoqismlar.almirab.uz/api/client_orders/${prefs.getString('client_id')}');
    var response = await http.get(url);
    print(response.body);
  }

  @override
  void initState() {
    _getSharedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.indigo,
        ),
      ),
      body: Column(
        children: [
          //text Tarix
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: const Text('Tarix',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
          ),

          

        ],
      ),
    );
  }
}