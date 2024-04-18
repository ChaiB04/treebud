import "package:flutter/cupertino.dart";
import "package:tree_bud/screens/arfunction.dart";
import "package:flutter/material.dart";
import "package:tree_bud/widgets/historyname.dart";

class InfoTree extends StatelessWidget {
  const InfoTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: const Color.fromRGBO(41, 57, 33, 1.0),
        iconTheme: const IconThemeData(color: Color.fromRGBO(245, 247, 248, 1.0)),
      ),
      backgroundColor: const Color.fromARGB(255, 118, 131, 109),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/banner.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 32.0),
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Pamela',
                          style: TextStyle(
                            color: Color.fromRGBO(245, 247, 248, 1.0),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                child: SizedBox(
                                  height: 330,
                                  width: MediaQuery.of(context).size.width,
                                  child: AlertDialog(
                                    title: const Padding(
                                      padding: EdgeInsets.only(bottom: 15.0),
                                      child: Text(
                                        'Pamela',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    backgroundColor: const Color.fromRGBO(
                                        232, 235, 235, 1.0),
                                    contentPadding: EdgeInsets.zero,
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    41, 57, 33, 1.0),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.zero,
                                                  bottomLeft: Radius.zero,
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              width: 108,
                                              child: const Text(
                                                'Carbon Offset',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    151, 190, 97, 1.0),
                                                borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(30.0),
                                                  bottomLeft:
                                                      Radius.circular(30.0),
                                                  bottomRight:
                                                      Radius.circular(30.0),
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              width: 100,
                                              height: 70,
                                              child: const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '2,340',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            41, 57, 33, 1.0),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Carbon(t)',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            41, 57, 33, 1.0),
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    41, 57, 33, 1.0),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                  bottomRight: Radius.zero,
                                                  topRight: Radius.zero,
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              width: 108,
                                              child: const Text(
                                                'Planted on',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    151, 190, 97, 1.0),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(30.0),
                                                  bottomLeft:
                                                      Radius.circular(30.0),
                                                  bottomRight:
                                                      Radius.circular(30.0),
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              width: 100,
                                              height: 70,
                                              child: const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '2024',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            41, 57, 33, 1.0),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '14th January',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            41, 57, 33, 1.0),
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              const Color.fromRGBO(
                                                  73, 97, 36, 1.0),
                                            ), // Change Colors.blue to your desired color
                                            shape: MaterialStateProperty.all<
                                                OutlinedBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  245, 247, 248, 1.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.info,
                            color: Color.fromRGBO(245, 247, 248, 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(73, 97, 36, 1.0),
                        ),
                      ),
                      child: const Text(
                        'Clean it',
                        style: TextStyle(
                            color: Color.fromRGBO(245, 247, 248, 1.0),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(73, 97, 36, 1.0),
                        ),
                      ),
                      child: const Text(
                        'Feed it',
                        style: TextStyle(
                            color: Color.fromRGBO(245, 247, 248, 1.0),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(73, 97, 36, 1.0),
                        ),
                      ),
                      child: const Text(
                        'Water it',
                        style: TextStyle(
                            color: Color.fromRGBO(245, 247, 248, 1.0),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 10, 48, 11),
            child: const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'History',
                  style: TextStyle(
                      color: Color.fromRGBO(245, 247, 248, 1.0),
                      fontSize: 26,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Container(
                  color: const Color.fromARGB(255, 10, 48, 11),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileInfo(
                        imageUrl:
                            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                        name: 'Ian Wright',
                        task: 'Watered tree ',
                        time: '5 hours ago',
                      ),
                      InfoCard(task: 'Watered tree', time: '5 hours ago'),
                      ProfileInfo(
                        imageUrl:
                            'https://images.unsplash.com/photo-1558072844-b2e8b546d415?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGUlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D',
                        name: 'You',
                        task: 'Cleaned tree ',
                        time: '1 day ago',
                      ),
                      InfoCard(task: 'Cleaned tree', time: '1 day ago'),
                      ProfileInfo(
                        imageUrl:
                            'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTh8fHByb2ZpbGUlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D',
                        name: 'Simon Craig',
                        task: 'Fed tree ',
                        time: '3 days ago',
                      ),
                      InfoCard(task: 'Fed tree', time: '3 days ago'),
                      ProfileInfo(
                        imageUrl:
                            'https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c2FwbGluZ3xlbnwwfHwwfHx8Mg%3D%3D',
                        name: 'Tree: Pamela',
                        task: 'Tree planted ',
                        time: '4 days ago',
                      ),
                      InfoCard(task: 'Tree planted', time: '4 days ago'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
