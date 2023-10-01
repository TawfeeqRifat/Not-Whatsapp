import 'package:flutter/material.dart';
import 'package:not_whatsapp/model/chat2.dart';
import 'package:rotating_icon_button/rotating_icon_button.dart';
import 'globals.dart' as globals;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List name = [
    'Dr Tafazul',
    'Uncle Afdal',
    'Krishna',
    'Eren',
    'Shinchan',
    'Miyamura',
    'Tawfeeq'
  ];
  List message = [
    'I\'m sorry to say this but...',
    'Mm ok',
    'you\'re selected to the team!!\nIn your dreams, lol',
    'Tatakae',
    'hehehe',
    'please save me from hori san',
    'Please Select me  (╥﹏╥)'
  ];
  List icon = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRse_qySp1Jnlo2SY6pcZ4wigBmxhYE_xX5ykVLbcnFiaQuSIaDV8af3Digc6Cd6J4jy8s&usqp=CAU',
    'https://cdn.pixabay.com/photo/2022/12/01/04/42/man-7628305_640.jpg',
    'https://cdn.pixabay.com/photo/2022/12/01/04/35/sunset-7628294_640.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaaBCc7DkhqHjrhHnHSWDTzL0n0nBGxtL6IA&usqp=CAU',
    'https://cdn.pixabay.com/photo/2022/12/01/04/40/backpacker-7628303_1280.jpg',
    'https://i.pinimg.com/736x/8f/a0/30/8fa030681a340c86f72503a6b20f9711.jpg',
    'https://nautiljon.com/images/manga_persos/00/39/mini/takakura_ken_8793.webp?10'
  ];

  void addlist() {
    for (var i = 0; i < name.length; i++) {
      Chat2 temp = Chat2();
      temp.get(name[i], icon[i], message[i]);

      globals.listOfChat2.add(temp);
      print('loop$i');
    }
  }

  //for changing between asc sort and desc sort
  bool asc = false;

  @override
  void initState() {
    super.initState();
    addlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 143, 216, 171),
        title: const Text('Not Whatsapp'),
        actions: <Widget>[
          RotatingIconButton(
            onTap: () {
              setState(() {
                if (asc) {
                  globals.listOfChat2.sort((a, b) => b.name.compareTo(a.name));
                  asc = false;
                } else {
                  globals.listOfChat2.sort((a, b) => a.name.compareTo(b.name));
                  asc = true;
                }
              });
            },
            borderRadius: 10.0,
            rotateType: RotateType.semi,
            clockwise: false,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            background: Colors.transparent,
            child: const Icon(
              Icons.sort,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: globals.listOfChat2.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(globals.listOfChat2[index].name),
              subtitle: Text(globals.listOfChat2[index].message),
              leading: GestureDetector(
                  onTap: () {
                    print('$index has been clicked!');
                    globals.current = index;
                    setState(() {
                      globals.current = index;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const profileViewer()),
                      );
                    });
                  },
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(globals.listOfChat2[index].icon),
                  )),
            );
          }),
    );
  }
}

class profileViewer extends StatefulWidget {
  const profileViewer({super.key});

  @override
  State<profileViewer> createState() => _profileViewerState();
}

class _profileViewerState extends State<profileViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Align(
      alignment: Alignment(0, -0.5),
      child: Image.network(globals.listOfChat2[globals.current].icon),
    ));
  }
}
