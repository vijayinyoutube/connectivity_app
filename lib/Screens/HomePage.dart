import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var subscription;
  @override
  initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print("Changed");      
    });
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connectivity"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Check connection"),
          onPressed: () {
            checkConnection();
          },
        ),
      ),
    );
  }

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("I am connected to a mobile network.");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("I am connected to a wifi network.");
    } else if (connectivityResult == ConnectivityResult.none) {
      print("I am not connected to any network :(");
    }
  }
}
