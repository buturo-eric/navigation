import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:navigation/Provider/provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Consumer<UiProvider>(
            builder: (context, UiProvider notifier, child) {
              return ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("Dark theme"),
                trailing: Switch(
                  value: notifier.isDark,
                  onChanged: (value) => notifier.changeTheme(),
                ),
              );
            },
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              height: double.infinity,
              child: StreamBuilder(
                stream: Connectivity().onConnectivityChanged,
                builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
                  print(snapshot.toString());
                  if (snapshot.hasData) {
                    ConnectivityResult? result = snapshot.data;
                    if (result == ConnectivityResult.mobile) {
                      return connected('Mobile');
                    } else if (result == ConnectivityResult.wifi) {
                      return connected('WIFI');
                    } else {
                      return noInternet();
                    }
                  } else {
                    return loading();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loading() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }

  Widget connected(String type) {
    return Center(
      child: Text(
        "$type Connected",
        style: const TextStyle(
          color: Colors.green,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget noInternet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/no_internet.png',
          color: Colors.red,
          height: 100,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: const Text(
            "No Internet connection",
            style: TextStyle(fontSize: 22),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text("Check your connection, then refresh the page."),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          onPressed: () async {
            ConnectivityResult result =
                await Connectivity().checkConnectivity();
            print(result.toString());
          },
          child: const Text("Refresh"),
        ),
      ],
    );
  }
}
