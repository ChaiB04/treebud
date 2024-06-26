import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../homepage.dart';

class NewTreeStep3 extends StatefulWidget {
  const NewTreeStep3({super.key});

  @override
  State<NewTreeStep3> createState() => _NewTreeStep3State();
}

class _NewTreeStep3State extends State<NewTreeStep3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: const Color.fromRGBO(41, 57, 33, 1.0),
        actions: const [
          //Profile picture
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1558072844-b2e8b546d415?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGUlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D",
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          //Background color (gradient)
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(164, 187, 139, 1.0),
                  Color.fromRGBO(127, 138, 127, 1.0),
                ],
              ),
            ),
          ),

          //leaf selections
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 100),
                  child: Text(
                    "Choose a name",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromRGBO(41, 57, 33, 1.0)),
                  ),
                ),
                Center(
                  child: Stack(
                    children: [
                      Transform.rotate(
                        angle: 0.5236, // 30 degrees in radians
                        child: Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/leaf_3.png'),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25, top: 10),
                          child: Column(
                            children: [
                              const SizedBox(
                                width: 125,
                                child: TextField(
                                  obscureText: false,
                                  style: TextStyle(color: Color.fromRGBO(245, 247, 248, 1.0)),
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              245, 247, 248, 1.0)),
                                    ),
                                    labelText: 'Name',
                                    labelStyle: TextStyle(
                                      color: Color.fromRGBO(245, 247, 248, 1.0),

                                    ),

                                  ),

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 120),
                                child: FilledButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'You planted a tree!',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Color.fromRGBO(
                                                  41, 57, 33, 1.0),
                                            ),
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                const SizedBox(height: 20),
                                                Image.asset(
                                                  'assets/images/treegrowing.gif',
                                                  height: 100,
                                                  width: 100,
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child:
                                                  const Text('Go to Home page'),
                                              onPressed: () {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomePage()),
                                                  (route) => false,
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color.fromRGBO(73, 97, 36, 1.0),
                                    ),
                                    // Setting border
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  child: const Text('Plant the tree!'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Loading bar
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 20),
                        child: SizedBox(
                          width: 80,
                          child: Image.asset(
                            'assets/images/leafs_step3.png',
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                              color:
                                  const Color.fromRGBO(0x97, 0xBE, 0x61, 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width / 1.6,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(41, 57, 33, 1.0),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.zero,
                                bottomRight: Radius.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
