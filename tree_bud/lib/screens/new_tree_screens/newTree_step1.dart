import 'package:flutter/material.dart';
import 'package:tree_bud/screens/new_tree_screens/newTree_step2.dart';

class NewTreeStep1 extends StatefulWidget {
  const NewTreeStep1({super.key});

  @override
  State<NewTreeStep1> createState() => _NewTreeStep1State();
}

class _NewTreeStep1State extends State<NewTreeStep1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: const Color.fromRGBO(41, 57, 33, 1.0),
          actions: const [
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
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 50),
                  child: Text(
                    "Choose a size",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromRGBO(41, 57, 33, 1.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewTreeStep2()),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/leaf_3.png'),
                            ),
                          ),
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 25, right: 40),
                            child: Text(
                              "Large",
                              style: TextStyle(
                                fontSize: 25,
                                color: Color.fromRGBO(245, 247, 248, 1.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewTreeStep2()),
                    );
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 150),
                        child: Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/leaf_2.png'),
                            ),
                          ),
                        ),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 60, right: 130),
                          child: Text(
                            "Medium",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(245, 247, 248, 1.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewTreeStep2()),
                    );
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: Container(
                          height: 110,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/leaf_1.png'),
                            ),
                          ),
                        ),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 55, left: 120),
                          child: Text(
                            "Small",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(245, 247, 248, 1.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50, right: 20),
                          child: SizedBox(
                            width: 40,
                            child: Image.asset(
                              'assets/images/leaf_step1.png',
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width / 1.5,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(0x97, 0xBE, 0x61, 1.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width / 4,
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
                ),
              ],
            )
          ],
        ));
  }
}
