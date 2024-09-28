import 'package:flutter/material.dart';
import 'next_page.dart';

// void main() {
//   runApp(
//     MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: Center(
//               child:Text("code with edison"),),
//               ),
//               body: Center(
//                  child: Text("welcome to code with edison tech talk "),),
//              ),)
//             );

// }
// main
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppExt(),
    );
  }
}



class MyAppExt extends StatefulWidget {
  const MyAppExt({super.key});

  @override
  State<MyAppExt> createState() => _MyAppExtState();
}

class _MyAppExtState extends State<MyAppExt> {
  String buttonName = "click me";
  int activeIndex = 0;
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue, 
        title: const Center(child: Text("code with edison")),
      ),
      body: Center(
          child: activeIndex == 0
              ? Container(
                  color: Colors.blueAccent,
                  // width: double.infinity,
                  // height: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: const Color.fromRGBO(10, 3, 100, 0.5),
                          //     foregroundColor: Colors.white
                          //   ),
                          //     onPressed: () {
                          //       // print(" bidy butotn clicked ");
                          //       setState(() {
                          //         buttonName = "ooh u clicked me";
                          //       });
                          //     },
                          // child: Text(buttonName)),
                          ElevatedButton(
                              onPressed: () {
                                // print(" bidy butotn clicked ");
                                setState(() {
                                  buttonName = "ooh u clicked me";
                                });
                              },
                              child: Text(buttonName)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                // print(" bidy butotn clicked ");
                                // setState(() {
                                //   buttonName = "ooh u clicked me";
                                // });
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const NextPage(),
                                  ),
                                );
                              },
                              child: const Text("Next Page")),
                          // ElevatedButton(
                          //     onPressed: () {
                          //       // print(" bidy butotn clicked ");
                          //       setState(() {
                          //         buttonName = "ooh u clicked me";
                          //       });
                          //     },
                          //     child: Text(buttonName)),
                        ],
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      _isClicked = !_isClicked;
                    });
                  },
                  child: SizedBox(
                    child: _isClicked
                        ? Image.asset('images/solvit.jpeg')
                        : Image.network(
                            "https://pixexid.com/api/download/image/a-4k-ultra-hd-wallpaper-of-a-fox-dressed-in-a-computer-programmers-outfit-sitt-1nobiek4.jpeg"),
                  ),
                )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "settings",
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: activeIndex,
        onTap: (int index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
    );
  }
}
