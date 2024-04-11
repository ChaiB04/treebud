import 'package:flutter/material.dart';
import 'package:tree_bud/screens/widgets/MapWidget.dart';

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
        toolbarHeight: 40,
        backgroundColor: const Color.fromRGBO(41, 57, 33, 1.0),
        actions:
        const [
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

          //Banner + logo
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.cover,
                      opacity: 0.75,
                    ),
                  ),
                  // child: SizedBox(
                  //   height: MediaQuery.of(context).size.height / 3.5,
                  //   width: 500,
                  // ),
                ),
                Center(
                  child: Image.asset(
                    'assets/icons/logo_treebud.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),

          //Tree trunk
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            child: const Image(
              image: AssetImage('assets/images/boomstam.png'),
            ),
          ),

          //Row of leaves with info
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3.8),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Choose",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "& Name",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Image.asset(
                            'assets/icons/Multiple Choice.png',
                          ),
                        )
                      ],
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Donate",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "& Join",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Image.asset(
                            'assets/icons/Donate.png',
                          ),
                        )
                      ],
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Take Care",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            "& Enjoy",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Image.asset(
                            'assets/icons/Earth Care.png',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),

          //maps + details of maps
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.5),
              child: Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 125),
                      child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(41, 57, 33, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  top: 100.0,
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: Text(
                                    "Find your tree buddies and take care of them together!",
                                    style: TextStyle(
                                      color: Color.fromRGBO(245, 247, 248, 1.0),
                                    )),
                              ),
                              FilledButton(
                                onPressed: () => {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color.fromRGBO(73, 97, 36, 1.0),
                                  ),
                                  // Setting border
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                child: const Text('Plant your own!'),
                              ),
                            ],
                          )),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          border: Border.all(
                            color: const Color.fromRGBO(41, 57, 33, 1.0),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const MapWidget(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 180),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 45),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(73, 97, 36, 1.0),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Choose a tree!",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: const Color.fromRGBO(245, 247, 248, 1.0),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
