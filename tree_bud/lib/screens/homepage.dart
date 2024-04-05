import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        toolbarHeight: 40,
      ),
      body: Stack(
          children: [
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
            Container(
              color: Colors.blue,
              child : SizedBox(
                height: MediaQuery.of(context).size.height / 3.5 ,
                width: 500,
              ),
            ),
             Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              child: const Image(
                image: AssetImage('assets/images/boomstam.png'),
              ),

            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.8),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(41, 57, 33, 1.0),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70),
                        topRight: Radius.circular(70),
                        bottomLeft: Radius.circular(70),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(73, 97, 36, 1.0),

                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70),
                        topRight: Radius.circular(70),
                        bottomLeft: Radius.circular(70),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(151, 190, 97, 1.0),

                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70),
                        topRight: Radius.circular(70),
                        bottomLeft: Radius.circular(70),
                      ),
                    ),
                  ),
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              child: Center(
                child: Stack(
                  children: [
                    // Red container
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        border: Border.all(
                          color: Color.fromRGBO(41, 57, 33, 1.0),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                      Padding(padding: const EdgeInsets.only(top: 180),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(41, 57, 33, 1.0),
                          borderRadius:  BorderRadius.only(

                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: const Text(
                          "Choose a tree!",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),)

                  ],
                ),

              )
            )
          ],
        ),
    );
  }
}
