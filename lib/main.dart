import 'package:flutter/material.dart';
import 'package:navigation/Provider/provider.dart';
import 'package:provider/provider.dart';
import 'Views/calculator_screen.dart';
import 'Views/login_page.dart';
import 'package:navigation/Views/settings.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Widget197(),
//     );
//   }
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Assignment',
          //By default theme setting, you can also set system
          // when your mobile theme is dark the app also become dark

          themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,

          //Our custom theme applied
          darkTheme: notifier.isDark ? notifier.darkTheme : notifier.lightTheme,

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(255, 27, 18, 93)),
            useMaterial3: true,
          ),
          // home: const Settings(),
          home: Widget197(),
        );
      }),
    );
  }
}

class Widget197 extends StatefulWidget {
  Widget197({Key? key}) : super(key: key);

  @override
  _Widget197State createState() => _Widget197State();
}

class _Widget197State extends State<Widget197> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome Home',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20)
        ],
      ),
    ),
    CalculatorScreen(),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hi, I'm Eric",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
    LoginPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index < 4) {
        _selectedIndex = index;
      } else {
        // Handle the case where the index is 4 (Settings)
        // In this case, navigate to the Settings page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Settings()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Navigation App',
          style: TextStyle(
            color: Color.fromARGB(255, 186, 229, 15),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 7, 50, 85),
        iconTheme: IconThemeData(color: Colors.white),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 7, 50, 85),
              ),
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: const Color.fromARGB(255, 227, 56, 56),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Calculator'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('About'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 200),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('LogOut'),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'LogOut',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(143, 17, 127, 94),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
