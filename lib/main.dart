import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:navigation/Provider/provider.dart';
import 'package:navigation/Views/contact_page.dart';
import 'package:provider/provider.dart';
import 'Views/calculator_screen.dart';
import 'Views/login_page.dart';
import 'package:navigation/Views/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Views/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  File? _selectedImage; // Change this variable name to _selectedImage

  late List<Widget> _widgetOptions;
  late Widget _aboutContentWidget; // Add this line

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
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
      _aboutContentWidget = AboutContentWidget(
          onImageSelected: _handleImageSelected), // Modify this line
      LoginPage(),
      ContactPage(), // Add ContactPage here
    ];
  }

  // Define a function to handle the selected image
  void _handleImageSelected(File? image) {
    setState(() {
      _selectedImage = image;
    });
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Use the picked image, for example, display it in an Image widget
      // You can also save the image to a file, upload it to a server, etc.
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    } else {
      // User canceled the image picking
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index < 4) {
        _selectedIndex = index;
      } else {
        switch (index) {
          case 2:
            // Call pickImage function when the "About" button is pressed
            pickImage();
            break;
          case 3: // Assuming 3 is the index for the "About" button
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraScreen()),
            );
            break;

          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ContactPage()), // Navigate to ContactPage when the "Contact" button is pressed
            );
            break;
          case 5:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Settings()),
            );
            break;
        }
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
              title: Text('Login'),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency_rounded),
              title: Text('Contact'),
              onTap: () {
                _onItemTapped(
                    4); // Navigate to ContactPage, which corresponds to index 4
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                _onItemTapped(
                    5); // Navigate to Settings, which corresponds to index 5
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
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Contact',
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

class AboutContentWidget extends StatefulWidget {
  final Function(File?) onImageSelected;

  const AboutContentWidget({Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  _AboutContentWidgetState createState() => _AboutContentWidgetState();
}

class _AboutContentWidgetState extends State<AboutContentWidget> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200, // Adjust the width and height as needed
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: ClipOval(
            child: _image != null
                ? Image.file(_image!, fit: BoxFit.cover)
                : Icon(Icons.person,
                    size: 50), // Placeholder icon if no image selected
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final picker = ImagePicker();
            final pickedFile =
                await picker.getImage(source: ImageSource.gallery);

            if (pickedFile != null) {
              final image = File(pickedFile.path);
              setState(() {
                _image = image;
              });
              widget.onImageSelected(
                  _image); // Notify parent widget about the selected image
            } else {
              print('Image picking canceled');
            }
          },
          child: Text('Pick Image'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final picker = ImagePicker();
            final pickedFile =
                await picker.pickImage(source: ImageSource.camera);

            if (pickedFile != null) {
              final image = File(pickedFile.path);
              setState(() {
                _image = image;
              });
              widget.onImageSelected(
                  _image); // Notify parent widget about the selected image
            } else {
              print('User canceled opening the camera');
            }
          },
          child: Text('Open Camera'),
        ),
      ],
    );
  }
}
